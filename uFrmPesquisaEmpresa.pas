unit uFrmPesquisaEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, System.Character, System.ImageList,
  Vcl.ImgList;

type
  TfrmPesquisaEmpresa = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GridBusca: TDBGrid;
    QryBuscaEmpresa: TFDQuery;
    DsBuscaEmpresa: TDataSource;
    CbbFiltro: TComboBox;
    Label1: TLabel;
    EdtFiltro: TEdit;
    SpdBtnPesquisar: TSpeedButton;
    SpdBtnConfirmar: TSpeedButton;
    SpdBtnCancelar: TSpeedButton;
    ImgsBotoes: TImageList;
    procedure SpdBtnPesquisarClick(Sender: TObject);
    procedure SpdBtnConfirmarClick(Sender: TObject);
    procedure SpdBtnCancelarClick(Sender: TObject);
    procedure GridBuscaDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure SelecionaEmpresa();
  public
    { Public declarations }
    function RetornaSelecao() : Integer;
  end;

var
  frmPesquisaEmpresa: TfrmPesquisaEmpresa;

implementation

{$R *.dfm}

uses uFrmPrincipal;

procedure TfrmPesquisaEmpresa.SpdBtnCancelarClick(Sender: TObject);
begin
  Self.Tag := 0;
  Close;
end;

procedure TfrmPesquisaEmpresa.SpdBtnConfirmarClick(Sender: TObject);
begin
  SelecionaEmpresa;
end;

procedure TfrmPesquisaEmpresa.SelecionaEmpresa;
begin
  if(QryBuscaEmpresa.RecordCount <= 0) then
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
procedure TfrmPesquisaEmpresa.GridBuscaDblClick(Sender: TObject);
begin
  SelecionaEmpresa;
end;

function TfrmPesquisaEmpresa.RetornaSelecao: Integer;
begin
  Result := QryBuscaEmpresa.FieldByName('IDEMPRESA').AsInteger;
end;
procedure TfrmPesquisaEmpresa.SpdBtnPesquisarClick(Sender: TObject);
var
  IndexRef01 : Integer;
  Tipo, RetornoValidacao : Integer;
begin

  IF(EdtFiltro.Text <> '') then
  begin
    QryBuscaEmpresa.Close;
    SpdBtnConfirmar.Enabled := false;
    // Retornar meu REF comentado, para replace abaixo pelo filtro
    IndexRef01 := QryBuscaEmpresa.SQL.IndexOf('--<REF 01>') + 1;
    case CbbFiltro.ItemIndex of
      0:
      // Filtro por código (IDEMPESA)
        QryBuscaEmpresa.SQL[IndexRef01] := 'AND empresa.IDEMPRESA = :filtro';
      1:
      // Filtro por nome (NMEMPRESA)
        QryBuscaEmpresa.SQL[IndexRef01] := 'AND empresa.NMEMPRESA LIKE :filtro ';
      2:
      // Filtro por CNPJ (NUCNPJ)
        QryBuscaEmpresa.SQL[IndexRef01] := 'AND REPLACE(REPLACE(REPLACE(empresa.NUCNPJ, ''.'', ''''), ''/'', ''''), ''-'', '''') LIKE :filtro';
      3:
      // Filtro por Titular (NMTITULAR - cadtit)
        QryBuscaEmpresa.SQL[IndexRef01] := 'AND cadtit.NMTITULAR LIKE :filtro ';
      else
      // Filtrar por nome se não tiver um index válido no combobox
        QryBuscaEmpresa.SQL[IndexRef01] := 'AND empresa.NMEMPRESA LIKE :filtro ';
    end;
    if(CbbFiltro.ItemIndex = 2) then begin
      // Removendo os caracteres especiais do CNPJ
      EdtFiltro.Text := StringReplace(EdtFiltro.Text, '.', '', [rfReplaceAll, rfIgnoreCase]);
      EdtFiltro.Text := StringReplace(EdtFiltro.Text, '-', '', [rfReplaceAll, rfIgnoreCase]);
      EdtFiltro.Text := StringReplace(EdtFiltro.Text, '/', '', [rfReplaceAll, rfIgnoreCase]);
      QryBuscaEmpresa.ParamByName('filtro').AsString := '%' + EdtFiltro.Text + '%';
    end;
    if (CbbFiltro.ItemIndex = 0) then begin
      // Validando se o campo é inteiro
      val(EdtFiltro.Text, Tipo, RetornoValidacao);
      if(RetornoValidacao <> 0) then
      begin
        frmPrincipal.Erro('Para filtro por código, o valor deve ser numérico!');
        Exit;
      end;

      QryBuscaEmpresa.ParamByName('filtro').AsInteger := StrToInt(EdtFiltro.Text);
    end else
      QryBuscaEmpresa.ParamByName('filtro').AsString := '%' + EdtFiltro.Text + '%';

    QryBuscaEmpresa.Open;

    if(QryBuscaEmpresa.RecordCount > 0) then
      SpdBtnConfirmar.Enabled := true
  end
  else
  begin
    frmPrincipal.Alerta('Você deve preencher o filtro!');
    Exit;
  end;

end;

end.
