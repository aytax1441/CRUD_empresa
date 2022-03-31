unit uFrmCadTitulares;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Mask, System.ImageList, Vcl.ImgList, Vcl.Buttons;

type
  TfrmCadTitulares = class(TForm)
    PnlCabecalho: TPanel;
    PnlCorpo: TPanel;
    PnlRodape: TPanel;
    Label1: TLabel;
    DBTxIDTITULAR: TDBText;
    QryTitular: TFDQuery;
    Label2: TLabel;
    DBTxNMEMPRESA: TDBText;
    DBLblEdtNMTITULAR: TDBLabeledEdit;
    GrpDadosPrincipais: TGroupBox;
    DBLblEdtNUCNPJCPF: TDBLabeledEdit;
    DsTitular: TDataSource;
    QryTitularIDTITULAR: TIntegerField;
    QryTitularNMTITULAR: TStringField;
    QryTitularNUCNPJCPF: TStringField;
    QryTitularNUINCRICAORG: TStringField;
    QryTitularDTNASCIMENTO: TDateField;
    QryTitularDTCADASTRO: TDateField;
    QryTitularTXEMAIL: TStringField;
    QryTitularTXOBS: TStringField;
    QryTitularTLRESIDENCIAL: TStringField;
    QryTitularTLCELULAR: TStringField;
    QryTitularTLCONTATO: TStringField;
    QryTitularNMCONTATO: TStringField;
    QryTitularSTATIVO: TStringField;
    QryTitularSTEXCLUIDO: TStringField;
    RdGrpNatureza: TRadioGroup;
    DBLblEdtNUINCRICAORG: TDBLabeledEdit;
    GrpDadosContato: TGroupBox;
    DBLblEdtDtCadastro: TDBLabeledEdit;
    DBLblEdtDtNascimento: TDBLabeledEdit;
    DBMemoTXOBS: TDBMemo;
    GrpObservacao: TGroupBox;
    SpdBtnCancelar: TSpeedButton;
    SpdBtnSalvar: TSpeedButton;
    ImgsBotoes: TImageList;
    DBLblEdtTLRESIDENCIAL: TDBLabeledEdit;
    DBLblEdtTLCELULAR: TDBLabeledEdit;
    GrpDadosContatoAdicional: TGroupBox;
    DBLblEdtTXEMAIL: TDBLabeledEdit;
    DBLblEdtNMCONTATO: TDBLabeledEdit;
    DBLblEdtTLCONTATO: TDBLabeledEdit;
    DBChkAtivo: TDBCheckBox;
    QryTitularIDEMPRESA: TIntegerField;
    QryEmpresa: TFDQuery;
    QryEmpresaNMEMPRESA: TStringField;
    DsEmpresa: TDataSource;
    procedure RdGrpNaturezaClick(Sender: TObject);
    procedure SpdBtnSalvarClick(Sender: TObject);
    procedure SpdBtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaNatureza(IndNatureza: Char);
  public
    { Public declarations }
    procedure IniciaTela(IndNatureza: Char; CodTitular: Integer)overload;
    procedure IniciaTela(CodEmpresa: Integer)overload;
  end;

var
  frmCadTitulares: TfrmCadTitulares;

implementation

{$R *.dfm}

uses uFrmPrincipal, uFrmCadEmpresas;

procedure TfrmCadTitulares.RdGrpNaturezaClick(Sender: TObject);
begin
  if RdGrpNatureza.ItemIndex = 0 then
    AtualizaNatureza('J')
  else
    AtualizaNatureza('F');
end;

procedure TfrmCadTitulares.SpdBtnCancelarClick(Sender: TObject);
begin
  QryTitular.Cancel;
  QryTitular.Close;
  Close;
end;

procedure TfrmCadTitulares.SpdBtnSalvarClick(Sender: TObject);
var
  NovoID: Integer;
begin
  if (QryTitular.State in ([dsInsert])) then
  begin
    NovoID := frmPrincipal.ObterMax('CADTITULAR', 'IDTITULAR');
    QryTitularIDTITULAR.AsInteger := NovoID;

    try
      frmPrincipal.ConnPrincipal.StartTransaction;
      QryTitular.Post;
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

    frmPrincipal.Informacao('Cadastro de titular feito com sucesso!' + Chr(13) +
      Chr(13) + 'Código: ' + IntToStr(NovoID) + Chr(13) + 'Titular: ' +
      QryTitularNMTITULAR.AsString);
  end
  else
  begin
    try
      frmPrincipal.ConnPrincipal.StartTransaction;
      QryTitular.Post;
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

    frmPrincipal.Informacao('Atualização de dados de titular feito com sucesso!' + Chr(13) +
      Chr(13) + 'Código: ' + QryTitularIDTITULAR.AsString + Chr(13) + 'Titular: ' +
      QryTitularNMTITULAR.AsString);
  end;

  Close;
end;

//
procedure TfrmCadTitulares.IniciaTela(IndNatureza: Char; CodTitular: Integer);
begin
  QryTitular.Close;
  QryTitular.ParamByName('COD_TITULAR').AsInteger := CodTitular;
  QryTitular.Open;

  AtualizaNatureza(IndNatureza);
end;

procedure TfrmCadTitulares.IniciaTela(CodEmpresa: Integer);
begin
  QryTitular.Close;
  QryTitular.ParamByName('COD_TITULAR').AsInteger := -1;
  QryTitular.Open;

  QryEmpresa.Close;
  QryEmpresa.ParamByName('COD_EMPRESA').AsInteger := CodEmpresa;
  QryEmpresa.Open;

  QryTitular.Insert;
  QryTitularIDEMPRESA.AsInteger := CodEmpresa;
  QryTitularSTATIVO.AsString := 'S';
  QryTitularSTEXCLUIDO.AsString := 'N';
  QryTitularDTCADASTRO.AsDateTime := Date;
end;

procedure TfrmCadTitulares.AtualizaNatureza(IndNatureza: Char);
begin
  if (IndNatureza = 'F') then
  begin
    if(RdGrpNatureza.ItemIndex <> 1) then
      RdGrpNatureza.ItemIndex := 1;
    DBLblEdtNUCNPJCPF.EditLabel.Caption := 'CPF*';
    DBLblEdtNUINCRICAORG.EditLabel.Caption := 'RG*';
    QryTitularNUCNPJCPF.EditMask := '000.000.000-00;1; ';
    QryTitularNUINCRICAORG.EditMask := '00.000.000-0;1; ';
  end
  else
  begin
    if(RdGrpNatureza.ItemIndex <> 0) then
      RdGrpNatureza.ItemIndex := 0;
    DBLblEdtNUCNPJCPF.EditLabel.Caption := 'CNPJ*';
    DBLblEdtNUINCRICAORG.EditLabel.Caption := 'Inscrição Estadual*';
    QryTitularNUCNPJCPF.EditMask := '00.000.000/0000-00;1; ';
    QryTitularNUINCRICAORG.EditMask := '000.000.000.000;1; ';
  end;
end;

end.
