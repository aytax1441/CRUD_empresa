unit uFrmCadCidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.StdCtrls,
  Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  System.ImageList, Vcl.ImgList, Vcl.Buttons;

type
  TfrmCadCidades = class(TForm)
    PnlRodape: TPanel;
    PnlCabecalho: TPanel;
    PnlCorpo: TPanel;
    Label1: TLabel;
    DBTxIDCIDADE: TDBText;
    DsCidade: TDataSource;
    QryCidade: TFDQuery;
    Label2: TLabel;
    DBTxNMESTADO: TDBText;
    QryEstado: TFDQuery;
    DsEstado: TDataSource;
    DBLabeledEdit1: TDBLabeledEdit;
    DBLabeledEdit2: TDBLabeledEdit;
    QryCidadeIDCIDADE: TIntegerField;
    QryCidadeNMCIDADE: TStringField;
    QryCidadeNOIBGE: TStringField;
    ImgsBotoes: TImageList;
    SpdBtnSalvar: TSpeedButton;
    SpdBtnCancelar: TSpeedButton;
    QryCidadeIDUF: TIntegerField;
    procedure SpdBtnCancelarClick(Sender: TObject);
    procedure SpdBtnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure IniciaTela(Codigo: Integer);
  end;

var
  frmCadCidades: TfrmCadCidades;

implementation

{$R *.dfm}

uses uFrmPrincipal;

procedure TfrmCadCidades.IniciaTela(Codigo: Integer);
begin
  // Tags:
  //    #1 - Novo Cadastro
  //    #2 - Editar Cadastro Existente
  if(Self.Tag = 1) then
  begin
    QryEstado.Close;
    QryEstado.ParamByName('COD_UF').AsInteger := Codigo;
    QryEstado.Open;

    QryCidade.Close;
    QryCidade.ParamByName('COD_CIDADE').AsInteger := -1;
    QryCidade.Open;

    QryCidade.Insert;
    QryCidadeIDUF.AsInteger := Codigo;
  end
  else
  begin
    QryEstado.Close;
    QryCidade.Close;

    QryCidade.ParamByName('COD_CIDADE').AsInteger := Codigo;
    QryCidade.Open;

    QryEstado.ParamByName('COD_UF').AsInteger := QryCidadeIDUF.AsInteger;
    QryEstado.Open;

    QryCidade.Edit;
  end;
end;

procedure TfrmCadCidades.SpdBtnCancelarClick(Sender: TObject);
begin
  QryCidade.Cancel;
  QryCidade.Close;
  Close;
end;

procedure TfrmCadCidades.SpdBtnSalvarClick(Sender: TObject);
var
  NovoID: Integer;
begin
  if (QryCidade.State in ([dsInsert])) then
  begin
    NovoID := frmPrincipal.ObterMax('CADCIDADE', 'IDCIDADE');
    QryCidadeIDCIDADE.AsInteger := NovoID;

    try
      frmPrincipal.ConnPrincipal.StartTransaction;
      QryCidade.Post;
      frmPrincipal.ConnPrincipal.Commit;
    except
      on e: Exception do
      begin
        frmPrincipal.ConnPrincipal.Rollback;
        frmPrincipal.Erro('Ocorreu um erro ao salvar o cadastro!' + Chr(13) +
          Chr(13) + e.Message);
        Exit;
      end;
    end;

    frmPrincipal.Informacao('Cadastro de cidade feito com sucesso!' + Chr(13) +
      Chr(13) + 'Código: ' + IntToStr(NovoID) + Chr(13) + 'Cidade: ' +
      QryCidadeNMCIDADE.AsString);
  end
  else
  begin
    try
      frmPrincipal.ConnPrincipal.StartTransaction;
      QryCidade.Post;
      frmPrincipal.ConnPrincipal.Commit;
    except
      on e: Exception do
      begin
        frmPrincipal.ConnPrincipal.Rollback;
        frmPrincipal.Erro('Ocorreu um erro ao salvar o cadastro!' + Chr(13) +
          Chr(13) + e.Message);
        Exit;
      end;
    end;

    frmPrincipal.Informacao('Atualização de cidade feita com sucesso!' + Chr(13)
      + Chr(13) + 'Código: ' + QryCidadeIDCIDADE.AsString + Chr(13) + 'Cidade: '
      + QryCidadeNMCIDADE.AsString);
  end;

  Close;
end;

end.
