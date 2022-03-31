unit uFrmPesquisaEstado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPesquisaEstado = class(TForm)
    ImgsBotoes: TImageList;
    Panel1: TPanel;
    Label1: TLabel;
    SpdBtnPesquisar: TSpeedButton;
    CbbFiltro: TComboBox;
    EdtFiltro: TEdit;
    Panel2: TPanel;
    GridBusca: TDBGrid;
    Panel3: TPanel;
    SpdBtnConfirmar: TSpeedButton;
    SpdBtnCancelar: TSpeedButton;
    QryBuscaEstado: TFDQuery;
    DsBuscaEstado: TDataSource;
    procedure SpdBtnPesquisarClick(Sender: TObject);
    procedure SpdBtnConfirmarClick(Sender: TObject);
    procedure SpdBtnCancelarClick(Sender: TObject);
    procedure GridBuscaDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure SelecionaEmpresa;
  public
    { Public declarations }
    function RetornaSelecao: Integer;
  end;

var
  frmPesquisaEstado: TfrmPesquisaEstado;

implementation

{$R *.dfm}

uses uFrmPrincipal;

procedure TfrmPesquisaEstado.GridBuscaDblClick(Sender: TObject);
begin
  SelecionaEmpresa;
end;

function TfrmPesquisaEstado.RetornaSelecao: Integer;
begin
  Result := QryBuscaEstado.FieldByName('IDUF').AsInteger;
end;

procedure TfrmPesquisaEstado.SelecionaEmpresa;
begin
  if (QryBuscaEstado.RecordCount <= 0) then
  begin
    Self.Tag := 0;
    Close;
  end
  else
  begin
    Self.Tag := 1;
    Close;
  end;
end;

procedure TfrmPesquisaEstado.SpdBtnCancelarClick(Sender: TObject);
begin
  Self.Tag := 0;
  Close;
end;

procedure TfrmPesquisaEstado.SpdBtnConfirmarClick(Sender: TObject);
begin
  SelecionaEmpresa;
end;

procedure TfrmPesquisaEstado.SpdBtnPesquisarClick(Sender: TObject);
var
  IndexRef01: Integer;
  Tipo, RetornoValidacao: Integer;
begin
  IF (EdtFiltro.Text <> '') then
  begin
    QryBuscaEstado.Close;
    SpdBtnConfirmar.Enabled := false;
    // Retornar meu REF comentado, para replace abaixo pelo filtro
    IndexRef01 := QryBuscaEstado.SQL.IndexOf('--<REF 01>') + 1;
    case CbbFiltro.ItemIndex of
      0:
        // Filtro por código (IDUF)
        QryBuscaEstado.SQL[IndexRef01] := 'WHERE c.IDUF = :filtro';
      1:
        // Filtro por nome (NMESTADO)
        QryBuscaEstado.SQL[IndexRef01] := 'WHERE c.NMESTADO LIKE :filtro';
      2:
        // Filtro por Sigla UF (SGESTADO)
        QryBuscaEstado.SQL[IndexRef01] := 'WHERE c.SGESTADO LIKE :filtro ';
      3:
        // Filtro por Cidade (NMCIDADE)
        QryBuscaEstado.SQL[IndexRef01] := 'WHERE c2.NMCIDADE = :filtro ';
    else
      // Filtrar por nome se não tiver um index válido no combobox
      QryBuscaEstado.SQL[IndexRef01] := 'WHERE c.NMESTADO LIKE :filtro ';
    end;

    if (CbbFiltro.ItemIndex in ([0, 2])) then
    begin
      // Validando se o campo é inteiro
      val(EdtFiltro.Text, Tipo, RetornoValidacao);
      if (RetornoValidacao <> 0) then
      begin
        frmPrincipal.Erro('Para filtro por código, o valor deve ser numérico!');
        Exit;
      end;

      QryBuscaEstado.ParamByName('filtro').AsInteger :=
        StrToInt(EdtFiltro.Text);
    end
    else
      QryBuscaEstado.ParamByName('filtro').AsString :=
        '%' + EdtFiltro.Text + '%';

    QryBuscaEstado.Open;

    if (QryBuscaEstado.RecordCount > 0) then
      SpdBtnConfirmar.Enabled := true
  end
  else
  begin
    frmPrincipal.Alerta('Você deve preencher o filtro!');
    Exit;
  end;

end;

end.
