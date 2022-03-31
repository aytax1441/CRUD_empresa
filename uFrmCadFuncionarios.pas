unit uFrmCadFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Mask,
  Vcl.CheckLst;

type
  TfrmCadFuncionarios = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    ImgsBotoes: TImageList;
    SpdBtnCancelar: TSpeedButton;
    SpdBtnSalvar: TSpeedButton;
    QryFuncionario: TFDQuery;
    DsFuncionario: TDataSource;
    QryEmpresa: TFDQuery;
    DsEmpresa: TDataSource;
    DBTxNMEMPRESA: TDBText;
    Label2: TLabel;
    DBTxIDFUNCIONARIO: TDBText;
    Label1: TLabel;
    QryCidade: TFDQuery;
    DsCidade: TDataSource;
    QryEstado: TFDQuery;
    DsEstado: TDataSource;
    GrpDadosPrincipais: TGroupBox;
    DBLblEdtNMFUNCIONARIO: TDBLabeledEdit;
    DBLblEdtDTCADASTRO: TDBLabeledEdit;
    DbChkAtivo: TDBCheckBox;
    QryFuncionarioIDFUNCIONARIO: TIntegerField;
    QryFuncionarioIDEMPRESA: TIntegerField;
    QryFuncionarioNMFUNCIONARIO: TStringField;
    QryFuncionarioNUCPF: TStringField;
    QryFuncionarioNURG: TStringField;
    QryFuncionarioDTNASCIMENTO: TDateField;
    QryFuncionarioTXEMAIL: TStringField;
    QryFuncionarioNUCARTEIRATRAB: TStringField;
    QryFuncionarioNUTITULOELEITOR: TStringField;
    QryFuncionarioNUCARTEIRAMOTORISTA: TStringField;
    QryFuncionarioTPCATERORIA: TStringField;
    QryFuncionarioDTVALIDADECARTEIRAMOT: TDateField;
    QryFuncionarioTLRESIDENCIAL: TStringField;
    QryFuncionarioTLCELULAR: TStringField;
    QryFuncionarioTLCONTATO: TStringField;
    QryFuncionarioNMCONTATO: TStringField;
    QryFuncionarioDTCONTRATACAO: TDateField;
    QryFuncionarioDTDEMISSAO: TDateField;
    QryFuncionarioDTCADASTRO: TDateField;
    QryFuncionarioSTATIVO: TStringField;
    QryFuncionarioTXOBS: TStringField;
    QryFuncionarioNMENDERECO: TStringField;
    QryFuncionarioNUENDERECO: TStringField;
    QryFuncionarioNMBAIRRO: TStringField;
    QryFuncionarioIDCIDADE: TIntegerField;
    QryFuncionarioIDUF: TIntegerField;
    QryFuncionarioNUCEP: TStringField;
    QryFuncionarioSTEXCLUIDO: TStringField;
    QryFuncionarioDTEXCLUIDO: TDateField;
    DBLblEdtDTNASCIMENTO: TDBLabeledEdit;
    GrpDadosEnderecoContato: TGroupBox;
    GrpDadosAdicionais: TGroupBox;
    GrpDocumentosPrincipais: TGroupBox;
    DBLblEdtNURG: TDBLabeledEdit;
    DBLblEdtNUCPF: TDBLabeledEdit;
    DBLblEdtNUTITULOELEITOR: TDBLabeledEdit;
    GrpCNH: TGroupBox;
    DBLblEdtNUCARTEIRAMOTORISTA: TDBLabeledEdit;
    DBLblEdtDTVALIDADECARTEIRAMOT: TDBLabeledEdit;
    GrpTrabalhista: TGroupBox;
    DBLblEdtNUCARTEIRATRAB: TDBLabeledEdit;
    DBLblEdtDTDEMISSAO: TDBLabeledEdit;
    DBLblEdtDTCONTRATACAO: TDBLabeledEdit;
    DBLblEdtTPCATEORIA: TDBLabeledEdit;
    GrpContatoAdicional: TGroupBox;
    DBLblEdtNMCONTATO: TDBLabeledEdit;
    DBLblEdtTLCONTATO: TDBLabeledEdit;
    GrpContato: TGroupBox;
    DBLblEdtTXEMAIL: TDBLabeledEdit;
    DBLblEdtTLRESIDENCIAL: TDBLabeledEdit;
    DBLblEdtTLCELULAR: TDBLabeledEdit;
    GrpEndereco: TGroupBox;
    DBLkpCbbUF: TDBLookupComboBox;
    DBLkpCbbCidade: TDBLookupComboBox;
    EdtCodCidade: TButtonedEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EdtCodUF: TButtonedEdit;
    DBLblEdtNMENDERECO: TDBLabeledEdit;
    DBLblEdtNUENDERECO: TDBLabeledEdit;
    DBLblEdtNMBAIRRO: TDBLabeledEdit;
    DBLblEdtNUCEP: TDBLabeledEdit;
    GroupBox1: TGroupBox;
    DBMemoTXOBS: TDBMemo;
    QryEstadoIDUF: TIntegerField;
    QryEstadoNMESTADO: TStringField;
    QryEstadoSGESTADO: TStringField;
    QryCidadeIDCIDADE: TIntegerField;
    QryCidadeNMCIDADE: TStringField;
    QryCidadeIDUF: TIntegerField;
    QryCidadeNOIBGE: TStringField;
    QryEmpresaNMEMPRESA: TStringField;
    procedure EdtCodCidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodUFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QryFuncionarioIDUFChange(Sender: TField);
    procedure FormShow(Sender: TObject);
    procedure QryFuncionarioIDCIDADEChange(Sender: TField);
    procedure EdtCodUFRightButtonClick(Sender: TObject);
    procedure EdtCodCidadeRightButtonClick(Sender: TObject);
    procedure SpdBtnSalvarClick(Sender: TObject);
    procedure SpdBtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure SelecionaEstado()overload;
    procedure SelecionaEstado(CodCidade: Integer)overload;
    procedure SelecionaCidade();
    procedure AbrePesquisa(CodPesquisa: Integer);
  public
    { Public declarations }
    procedure IniciaTela(Codigo, TipoCodigo: Integer);
  end;

var
  frmCadFuncionarios: TfrmCadFuncionarios;

implementation

{$R *.dfm}

uses uFrmPrincipal, uFrmPesquisaCidade, uFrmPesquisaEstado;

procedure TfrmCadFuncionarios.IniciaTela(Codigo: Integer; TipoCodigo: Integer);
begin
  // TipoCodigo
  // #1 - Código da Empresa (Cadastrando novo funcionário);
  // #2 - Código do Funcionário (Editando cadastro existente)
  QryFuncionario.Close;
  QryEmpresa.Close;

  QryCidade.Close;
  QryCidade.ParamByName('COD_UF').AsInteger := 0;
  QryCidade.ParamByName('COD_CIDADE').AsInteger := 0;
  QryCidade.Open;

  QryEstado.Close;
  QryEstado.ParamByName('COD_UF').AsInteger := 0;
  QryEstado.Open;

  if TipoCodigo = 1 then
  begin
    QryFuncionario.ParamByName('COD_FUNCIONARIO').AsInteger := -1;
    QryFuncionario.Open;
    QryFuncionario.Insert;

    QryFuncionarioIDEMPRESA.AsInteger := Codigo;
    QryFuncionarioDTCADASTRO.AsDateTime := Date;
    QryFuncionarioSTEXCLUIDO.AsString := 'N';
    QryFuncionarioSTATIVO.AsString := 'S';

    QryEmpresa.ParamByName('COD_EMPRESA').AsInteger := Codigo;
    QryEmpresa.Open;
  end
  else
  begin
    QryFuncionario.ParamByName('COD_FUNCIONARIO').AsInteger := Codigo;
    QryFuncionario.Open;
    QryFuncionario.Edit;

    EdtCodCidade.Text := QryFuncionarioIDCIDADE.AsString;
    EdtCodUF.Text := QryFuncionarioIDUF.AsString;

    QryEmpresa.ParamByName('COD_EMPRESA').AsInteger :=
      QryFuncionarioIDEMPRESA.AsInteger;
    QryEmpresa.Open;
  end;
end;

procedure TfrmCadFuncionarios.EdtCodCidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Char(Key) = #13 then
  begin
    if (EdtCodCidade.Text <> '') and (EdtCodCidade.Text <> '0') then
      SelecionaCidade
    else
    begin
      QryCidade.Close;
      if QryFuncionarioIDUF.AsInteger = 0 then
        QryCidade.ParamByName('COD_UF').AsInteger := 0
      else
        if QryCidade.ParamByName('COD_UF').AsInteger <> QryFuncionarioIDUF.AsInteger then
          QryCidade.ParamByName('COD_UF').AsInteger := QryFuncionarioIDUF.AsInteger;

      QryCidade.ParamByName('COD_CIDADE').AsInteger := 0;
      QryCidade.Open;

      if QryCidade.RecordCount > 0 then
        DBLkpCbbCidade.Enabled := True
      else
        DBLkpCbbCidade.Enabled := False;

      QryFuncionarioIDCIDADE.Clear;
    end;
  end;
end;

procedure TfrmCadFuncionarios.EdtCodCidadeRightButtonClick(Sender: TObject);
begin
  AbrePesquisa(2);
end;

procedure TfrmCadFuncionarios.EdtCodUFKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Char(Key) = #13 then
  begin
    if (EdtCodUF.Text <> '') and (EdtCodUF.Text <> '0') then
      SelecionaEstado
    else
    begin
      QryEstado.Close;
      QryEstado.ParamByName('COD_UF').AsInteger := 0;
      QryEstado.Open;

      QryCidade.Close;
      QryCidade.ParamByName('COD_UF').AsInteger := 0;
      QryCidade.Open;

      QryFuncionarioIDUF.Clear;
      QryFuncionarioIDCIDADE.Clear;
    end;
  end;
end;

procedure TfrmCadFuncionarios.EdtCodUFRightButtonClick(Sender: TObject);
begin
  AbrePesquisa(1);
end;

procedure TfrmCadFuncionarios.FormShow(Sender: TObject);
begin
  QryFuncionario.Edit;
end;

procedure TfrmCadFuncionarios.QryFuncionarioIDCIDADEChange(Sender: TField);
begin
  EdtCodCidade.Text := QryFuncionarioIDCIDADE.AsString;
  if (QryFuncionarioIDCIDADE.AsInteger <> 0) and (EdtCodCidade.Text <> '') then
    SelecionaCidade;
end;

procedure TfrmCadFuncionarios.QryFuncionarioIDUFChange(Sender: TField);
begin
  EdtCodUF.Text := QryFuncionarioIDUF.AsString;
  QryCidade.Close;
  QryCidade.ParamByName('COD_UF').AsInteger := QryFuncionarioIDUF.AsInteger;
  QryCidade.ParamByName('COD_CIDADE').AsInteger := 0;
  QryCidade.Open;

  if QryCidade.RecordCount > 0 then
    DBLkpCbbCidade.Enabled := True
  else
  begin
    DBLkpCbbCidade.Enabled := False;
    frmPrincipal.Alerta('Não há cidades cadastradas para essa UF!');
  end;
end;

procedure TfrmCadFuncionarios.SelecionaEstado;
begin

  QryEstado.Close;
  QryEstado.ParamByName('COD_UF').AsInteger := StrToInt(EdtCodUF.Text);
  QryEstado.Open;

  if QryEstado.RecordCount > 0 then
  begin
    QryFuncionarioIDUF.AsInteger := QryEstadoIDUF.AsInteger;
    QryCidade.Close;
    QryCidade.ParamByName('COD_CIDADE').AsInteger := 0;
    QryCidade.ParamByName('COD_UF').AsInteger := StrToInt(EdtCodUF.Text);
    QryCidade.Open;

    if QryCidade.RecordCount > 0 then
    begin
      EdtCodCidade.Text := '';
      DBLkpCbbCidade.Enabled := True;
    end
    else
    begin
      DBLkpCbbCidade.Enabled := False;
      frmPrincipal.Alerta('Não há cidades cadastradas para essa UF!');
      QryFuncionarioIDCIDADE.Clear;
      Exit;
    end;
  end
  else
    AbrePesquisa(1);
end;

procedure TfrmCadFuncionarios.SelecionaEstado(CodCidade: Integer);
begin
  QryEstado.Close;
  QryEstado.ParamByName('COD_UF').AsInteger := QryCidadeIDUF.AsInteger;
  QryEstado.Open;

  QryFuncionarioIDUF.AsInteger := QryCidadeIDUF.AsInteger;
end;

procedure TfrmCadFuncionarios.SpdBtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadFuncionarios.SpdBtnSalvarClick(Sender: TObject);
var
  NovoID: Integer;
begin
  if (QryFuncionario.State in ([dsInsert])) then
  begin
    NovoID := frmPrincipal.ObterMax('CADFUNCIONARIOS', 'IDFUNCIONARIO');
    QryFuncionarioIDFUNCIONARIO.AsInteger := NovoID;
    QryFuncionarioDTCADASTRO.AsDateTime := Date;
    try
      frmPrincipal.ConnPrincipal.StartTransaction;
      QryFuncionario.Post;
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

    frmPrincipal.Informacao('Cadastro de funcionário feito com sucesso!' + Chr(13) +
      Chr(13) + 'Código: ' + IntToStr(NovoID) + Chr(13) + 'Funcionário: ' +
      QryFuncionarioNMFUNCIONARIO.AsString);
  end
  else
  begin
    try
      frmPrincipal.ConnPrincipal.StartTransaction;
      QryFuncionario.Post;
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

    frmPrincipal.Informacao('Atualização de dados de funcionário feito com sucesso!'
      + Chr(13) + Chr(13) + 'Código: ' + QryFuncionarioIDFUNCIONARIO.AsString + Chr(13)
      + 'Funcionário: ' + QryFuncionarioNMFUNCIONARIO.AsString);
  end;

  Close;
end;

procedure TfrmCadFuncionarios.SelecionaCidade;
begin
  QryCidade.Close;
  QryCidade.ParamByName('COD_CIDADE').AsInteger := StrToInt(EdtCodCidade.Text);
  QryCidade.ParamByName('COD_UF').AsInteger := 0;
  QryCidade.Open;

  if QryCidade.RecordCount > 0 then
  begin
    if (QryEstado.Active = False) or
      (QryEstadoIDUF.AsInteger <> QryCidadeIDUF.AsInteger) then
      SelecionaEstado(QryCidadeIDCIDADE.AsInteger);
    DBLkpCbbCidade.Enabled := True;
    if QryFuncionarioIDCIDADE.AsInteger <> QryCidadeIDCIDADE.AsInteger then
      QryFuncionarioIDCIDADE.AsInteger := QryCidadeIDCIDADE.AsInteger;
  end;
end;

procedure TfrmCadFuncionarios.AbrePesquisa(CodPesquisa: Integer);
var
  Codigo: Integer;
begin
  // CodPesquisa:
  // #1 = Estado
  // #2 = Cidade
  if CodPesquisa = 1 then
  begin
    if (frmPesquisaEstado <> nil) then
      FreeAndNil(frmPesquisaEstado);

    Application.CreateForm(TfrmPesquisaEstado, frmPesquisaEstado);

    frmPesquisaEstado.ShowModal;

    if frmPesquisaEstado.Tag = 1 then
      Codigo := frmPesquisaEstado.RetornaSelecao;

    if (Codigo > 0) AND (frmPesquisaEstado.Tag = 1) then
    begin
      EdtCodUF.Text := IntToStr(Codigo);
      SelecionaEstado;
    end;
    FreeAndNil(frmPesquisaEstado);
  end
  else
  begin
    if (frmPesquisaCidade <> nil) then
      FreeAndNil(frmPesquisaCidade);

    Application.CreateForm(TfrmPesquisaCidade, frmPesquisaCidade);

    if (QryEstado.Active = True) and (QryFuncionarioIDUF.AsInteger <> 0) then
      frmPesquisaCidade.PesquisaPorUF(QryEstadoIDUF.AsInteger);

    frmPesquisaCidade.ShowModal;

    if frmPesquisaCidade.Tag = 1 then
      Codigo := frmPesquisaCidade.RetornaSelecao;

    if (Codigo > 0) AND (frmPesquisaCidade.Tag = 1) then
    begin
      EdtCodCidade.Text := IntToStr(Codigo);
      SelecionaCidade;
    end;
    FreeAndNil(frmPesquisaEstado);
  end;
end;

end.
