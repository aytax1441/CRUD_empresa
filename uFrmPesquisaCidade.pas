unit uFrmPesquisaCidade;

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
  TfrmPesquisaCidade = class(TForm)
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
    DsBuscaCidade: TDataSource;
    QryBuscaCidade: TFDQuery;
    procedure SpdBtnPesquisarClick(Sender: TObject);
    procedure SpdBtnCancelarClick(Sender: TObject);
    procedure SpdBtnConfirmarClick(Sender: TObject);
    procedure GridBuscaDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure SelecionaEmpresa;
  public
    { Public declarations }
    function RetornaSelecao: Integer;
    procedure PesquisaPorUF(CodUF : Integer);
  end;

var
  frmPesquisaCidade: TfrmPesquisaCidade;

implementation

{$R *.dfm}

uses uFrmPrincipal;

procedure TfrmPesquisaCidade.PesquisaPorUF(CodUF: Integer);
begin
  QryBuscaCidade.ParamByName('COD_UF').AsInteger := CodUF;
end;
procedure TfrmPesquisaCidade.GridBuscaDblClick(Sender: TObject);
begin
  SelecionaEmpresa;
end;

function TfrmPesquisaCidade.RetornaSelecao: Integer;
begin
  Result := QryBuscaCidade.FieldByName('IDCIDADE').AsInteger;
end;

procedure TfrmPesquisaCidade.SelecionaEmpresa;
begin
  if(QryBuscaCidade.RecordCount <= 0) then
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
procedure TfrmPesquisaCidade.SpdBtnCancelarClick(Sender: TObject);
begin
  Self.Tag := 0;
  Close;
end;

procedure TfrmPesquisaCidade.SpdBtnConfirmarClick(Sender: TObject);
begin
  SelecionaEmpresa;
end;

procedure TfrmPesquisaCidade.SpdBtnPesquisarClick(Sender: TObject);
var
  IndexRef01: Integer;
  Tipo, RetornoValidacao: Integer;
begin

  IF (EdtFiltro.Text <> '') then
  begin
    QryBuscaCidade.Close;
    SpdBtnConfirmar.Enabled := false;
    // Retornar meu REF comentado, para replace abaixo pelo filtro
    IndexRef01 := QryBuscaCidade.SQL.IndexOf('--<REF 01>') + 1;
    case CbbFiltro.ItemIndex of
      0:
        // Filtro por código (IDCIDADE)
        QryBuscaCidade.SQL[IndexRef01] := 'WHERE c.IDCIDADE = :filtro';
      1:
        // Filtro por nome (NMCIDADE)
        QryBuscaCidade.SQL[IndexRef01] := 'WHERE c.NMCIDADE LIKE :filtro';
      2:
        // Filtro por cód UF (IDUF)
        QryBuscaCidade.SQL[IndexRef01] := 'WHERE c.IDUF = :filtro ';
      3:
        // Filtro por nome UF (NMESTADO)
        QryBuscaCidade.SQL[IndexRef01] := 'WHERE c2.NMESTADO LIKE :filtro';
      4:
        // Filtro por sigla UF (SGESTADO)
        QryBuscaCidade.SQL[IndexRef01] := 'WHERE c2.SGESTADO LIKE :filtro ';
    else
      // Filtrar por nome se não tiver um index válido no combobox
      QryBuscaCidade.SQL[IndexRef01] := 'WHERE c.NMCIDADE LIKE :filtro ';
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

      QryBuscaCidade.ParamByName('filtro').AsInteger :=
        StrToInt(EdtFiltro.Text);
    end
    else
      QryBuscaCidade.ParamByName('filtro').AsString :=
        '%' + EdtFiltro.Text + '%';

    QryBuscaCidade.Open;

    if (QryBuscaCidade.RecordCount > 0) then
      SpdBtnConfirmar.Enabled := true
  end
  else
  begin
    frmPrincipal.Alerta('Você deve preencher o filtro!');
    Exit;
  end;

end;

end.
