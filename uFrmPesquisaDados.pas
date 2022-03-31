unit uFrmPesquisaDados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls;

type
  TfrmPesquisa = class(TForm)
    PnlDados: TPanel;
    PnlAcoes: TPanel;
    GridBusca: TDBGrid;
    DsBusca: TDataSource;
    QryBusca: TFDQuery;
    procedure GridBuscaDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure SelecionaItemGrid();
  public
    { Public declarations }
    DefTipoRetorno : Integer;
    RetornoInt : Integer;
    RetornoStr : string;
    RetornoDt : TDateTime;
    RetornoCur : Currency;

    procedure CarregaPesquisa(TituloPesquisa, ConsultaSQL : string; Parametros : array of string; TipoRetorno : integer);

  end;

var
  frmPesquisa: TfrmPesquisa;

implementation

{$R *.dfm}

uses uFrmPrincipal;

procedure TfrmPesquisa.CarregaPesquisa(TituloPesquisa, ConsultaSQL : string; Parametros : array of string; TipoRetorno : integer);
var
  ContArray : Integer;
begin
  {
    Tipos de retorno:
      #1 -> Inteiro (Integer);
      #2 -> Texto (String);
      #3 -> Data (DateTime);
      #4 -> Real (Currency);
  }
  DefTipoRetorno := TipoRetorno;
  frmPesquisa.Caption := 'Pesquisa de ' + TituloPesquisa;

  QryBusca.Close;
  QryBusca.SQL.Clear;
  QryBusca.SQL.Add(ConsultaSQL);

  ContArray := 0;
  while(ContArray < Length(Parametros)) do
  begin
    QryBusca.Params[ContArray].Value := Parametros[ContArray];
    Inc(ContArray);
  end;

  try
    QryBusca.Open;
  except
  on e : Exception do
  begin
    MessageDlg('Ocorreu um erro ao processar a tela de pesquisa de dados!' + Chr(13) + 'Erro: ' + e.Message, TMsgDlgType.mtError, mbOKCancel, 0);
  end;
  end;
end;
procedure TfrmPesquisa.GridBuscaDblClick(Sender: TObject);
begin
  SelecionaItemGrid;
end;

procedure TfrmPesquisa.SelecionaItemGrid();
begin
  {
    Tipos de retorno:
      #1 -> Inteiro (Integer);
      #2 -> Texto (String);
      #3 -> Data (DateTime);
      #4 -> Real (Currency);
  }
  if QryBusca.RecordCount > 0 then
  begin
    case DefTipoRetorno of
    1: RetornoInt := QryBusca.Fields[0].AsInteger;
    2: RetornoStr := QryBusca.Fields[0].AsString;
    3: RetornoDt := QryBusca.Fields[0].AsDateTime;
    4: RetornoCur := QryBusca.Fields[0].AsCurrency;
    else
      RetornoStr := QryBusca.Fields[0].AsString;
    end;
    Close;
  end
  else
  begin
    //MessageDlg('Ocorreu um erro ao processar a tela de pesquisa de dados!' + Chr(13) + 'Erro: ' + e.Message, TMsgDlgType.mtError, mbOKCancel, 0);
  end;
end;
end.
