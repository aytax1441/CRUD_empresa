unit uFrmCadEmpresas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.Mask, Vcl.DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TfrmCadEmpresas = class(TForm)
    PnlCabecalho: TPanel;
    EdtCodEmpresa: TButtonedEdit;
    ImgsBotoes: TImageList;
    Label1: TLabel;
    PnlCorpo: TPanel;
    PnlRodape: TPanel;
    PgControl: TPageControl;
    TabDadosEmpresa: TTabSheet;
    DBChkAtiva: TDBCheckBox;
    QryEmpresa: TFDQuery;
    DsEmpresa: TDataSource;
    SpdBtnSalvar: TSpeedButton;
    SpdBtnEditar: TSpeedButton;
    SpdBtnCancelar: TSpeedButton;
    SpdBtnNovo: TSpeedButton;
    DBLblEdtNMEMPRESA: TDBLabeledEdit;
    DBLblEdtNUCNPJ: TDBLabeledEdit;
    DtCadastro: TDateTimePicker;
    Label2: TLabel;
    DBLblEdtNUINSCRICAO: TDBLabeledEdit;
    GrpDadosContato: TGroupBox;
    DBLblEdtTLCOMERCIAL: TDBLabeledEdit;
    DBLblEdtTLCELULAR: TDBLabeledEdit;
    DBLblEdtTXEMAIL: TDBLabeledEdit;
    DBMemoTXOBS: TDBMemo;
    Label4: TLabel;
    TabTitulares: TTabSheet;
    TabFuncionarios: TTabSheet;
    TabEnderecos: TTabSheet;
    SpdBtnExcluir: TSpeedButton;
    PnlCorpoFuncionarios: TPanel;
    PnlCabecalhoTitulares: TPanel;
    PnlCorpoTitulares: TPanel;
    PnlCorpoEnderecos: TPanel;
    SpdBtnEditarTitular: TSpeedButton;
    SpdBtnExcluirTitular: TSpeedButton;
    SpdBtnNovoTitular: TSpeedButton;
    DBTxtQtdTitularAtivo: TDBText;
    DBTxtQtdTitularTotal: TDBText;
    Panel1: TPanel;
    SpdBtnEditarFuncionario: TSpeedButton;
    SpdBtnExcluirFuncionario: TSpeedButton;
    SpdBtnNovoFuncionario: TSpeedButton;
    DBTxtQtdFuncionariosAtivo: TDBText;
    DBTxtQtdFuncionariosTotal: TDBText;
    Panel2: TPanel;
    SpdBtnEditarEndereco: TSpeedButton;
    SpdBtnExcluirEndereco: TSpeedButton;
    SpdBtnNovoEndereco: TSpeedButton;
    DBTxtQtdEnderecosAtivo: TDBText;
    DBTxtQtdEnderecosTotal: TDBText;
    DBGridTitulares: TDBGrid;
    QryTitulares: TFDQuery;
    DsTitulares: TDataSource;
    QryFuncionarios: TFDQuery;
    DsFuncionarios: TDataSource;
    DBGridFuncionarios: TDBGrid;
    QryExcluiEmpresa: TFDQuery;
    QryEnderecos: TFDQuery;
    DsEnderecos: TDataSource;
    QryEmpresaNUCNPJ: TStringField;
    QryEmpresaNUINSCRICAO: TStringField;
    QryEmpresaDTABERTURA: TDateField;
    QryEmpresaTLCOMERCIAL: TStringField;
    QryEmpresaTLCELULAR: TStringField;
    QryEmpresaIDEMPRESA: TIntegerField;
    QryEmpresaNMEMPRESA: TStringField;
    QryEmpresaSTATIVO: TStringField;
    QryEmpresaDTCADASTRO: TDateField;
    QryEmpresaTXOBS: TStringField;
    QryEmpresaTXEMAIL: TStringField;
    QryEmpresaSTEXCLUIDO: TStringField;
    QryEmpresaQTD_TIT_ATIVO: TStringField;
    QryEmpresaQTD_TIT_TOTAL: TStringField;
    QryEmpresaQTD_FUNC_ATIVO: TStringField;
    QryEmpresaQTD_FUNC_TOTAL: TStringField;
    QryEmpresaQTD_END_ATIVO: TStringField;
    QryEmpresaQTD_END_TOTAL: TStringField;
    DBLblEdtDtAbertura: TDBLabeledEdit;
    QryTitularesIDTITULAR: TIntegerField;
    QryTitularesNMTITULAR: TStringField;
    QryTitularesNUCNPJCPF: TStringField;
    QryTitularesNUINCRICAORG: TStringField;
    QryTitularesTXOBS: TStringField;
    QryTitularesSTEXCLUIDO: TStringField;
    QryTitularesSTATIVO: TStringField;
    QryFuncionariosIDFUNCIONARIO: TIntegerField;
    QryFuncionariosNMFUNCIONARIO: TStringField;
    QryFuncionariosNUCPF: TStringField;
    QryFuncionariosNURG: TStringField;
    QryFuncionariosTXEMAIL: TStringField;
    QryFuncionariosSTEXCLUIDO: TStringField;
    QryFuncionariosDTEXCLUIDO: TDateField;
    QryFuncionariosSTATIVO: TStringField;
    QryTitularesDTEXCLUIDO: TDateField;
    DBGridEnderecos: TDBGrid;
    QryEnderecosIDENDERECO: TIntegerField;
    QryEnderecosNMENDERECO: TStringField;
    QryEnderecosNUENDERECO: TStringField;
    QryEnderecosNMBAIRRO: TStringField;
    QryEnderecosNMCIDADE: TStringField;
    QryEnderecosNMESTADO: TStringField;
    QryEnderecosSTATIVO: TStringField;
    QryEnderecosSTEXCLUIDO: TStringField;
    QryEnderecosDTEXCLUIDO: TDateField;
    procedure EdtCodEmpresaRightButtonClick(Sender: TObject);
    procedure EdtCodEmpresaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpdBtnEditarClick(Sender: TObject);
    procedure SpdBtnCancelarClick(Sender: TObject);
    procedure SpdBtnNovoClick(Sender: TObject);
    procedure SpdBtnSalvarClick(Sender: TObject);
    procedure TabTitularesShow(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpdBtnExcluirClick(Sender: TObject);
    procedure SpdBtnNovoTitularClick(Sender: TObject);

    procedure SpdBtnEditarTitularClick(Sender: TObject);
    procedure SpdBtnExcluirTitularClick(Sender: TObject);
    procedure TabFuncionariosShow(Sender: TObject);
    procedure DBGridTitularesDblClick(Sender: TObject);
    procedure SpdBtnNovoFuncionarioClick(Sender: TObject);
    procedure SpdBtnEditarFuncionarioClick(Sender: TObject);
    procedure SpdBtnExcluirFuncionarioClick(Sender: TObject);
    procedure SpdBtnNovoEnderecoClick(Sender: TObject);
    procedure SpdBtnEditarEnderecoClick(Sender: TObject);
    procedure DBGridFuncionariosDblClick(Sender: TObject);
    procedure DBGridEnderecosDblClick(Sender: TObject);
    procedure TabEnderecosShow(Sender: TObject);
    procedure SpdBtnExcluirEnderecoClick(Sender: TObject);
  private
    { Private declarations }
    NovoID: Integer;

    procedure PesquisaEmpresa();
    procedure AbrirPesquisa();
    procedure ExcluiEmpresa(Tabela: string);
  public
    { Public declarations }
  end;

var
  frmCadEmpresas: TfrmCadEmpresas;

implementation

{$R *.dfm}

uses uFrmPrincipal, uFrmPesquisaEmpresa, uFrmCadTitulares, uFrmCadFuncionarios,
  uFrmCadEnderecos;

procedure TfrmCadEmpresas.PesquisaEmpresa;
begin
  if (EdtCodEmpresa.Text <> '') AND (EdtCodEmpresa.Text <> '0') AND
    not(QryEmpresa.State in ([dsEdit, dsInsert])) then
  begin
    QryEmpresa.Close;
    QryEmpresa.ParamByName('COD_EMPRESA').AsInteger :=
      StrToInt(EdtCodEmpresa.Text);
    QryEmpresa.Open;

    if (QryEmpresa.RecordCount <= 0) then
      AbrirPesquisa
    else
    begin
      DtCadastro.Date := QryEmpresaDTCADASTRO.AsDateTime;
      SpdBtnEditar.Enabled := True;
      SpdBtnExcluir.Enabled := True;
      TabTitulares.Enabled := True;
      TabEnderecos.Enabled := True;
      TabFuncionarios.Enabled := True;

      PgControl.ActivePage := TabDadosEmpresa;
    end;
  end;
end;

procedure TfrmCadEmpresas.SpdBtnCancelarClick(Sender: TObject);
begin
  QryEmpresa.Cancel;
  EdtCodEmpresa.Text := QryEmpresaIDEMPRESA.AsString;

  SpdBtnNovo.Enabled := True;
  if QryEmpresa.RecordCount > 0 then
  begin
    SpdBtnEditar.Enabled := True;
    SpdBtnExcluir.Enabled := True;
  end;
  EdtCodEmpresa.Enabled := True;

  TabDadosEmpresa.Enabled := False;

  DBLblEdtNMEMPRESA.Enabled := False;
  SpdBtnSalvar.Enabled := False;
  SpdBtnCancelar.Enabled := False;

  DBChkAtiva.ReadOnly := True;
end;

procedure TfrmCadEmpresas.SpdBtnEditarClick(Sender: TObject);
begin
  if (QryEmpresa.RecordCount > 0) then
  begin
    QryEmpresa.Edit;

    SpdBtnNovo.Enabled := False;
    SpdBtnEditar.Enabled := False;
    SpdBtnExcluir.Enabled := False;
    EdtCodEmpresa.Enabled := False;

    PgControl.ActivePage := TabDadosEmpresa;
    TabDadosEmpresa.Enabled := True;

    DBLblEdtNMEMPRESA.Enabled := True;
    SpdBtnSalvar.Enabled := True;
    SpdBtnCancelar.Enabled := True;

    DBChkAtiva.ReadOnly := False;

  end;
end;

procedure TfrmCadEmpresas.SpdBtnEditarEnderecoClick(Sender: TObject);
begin
  if (frmCadEnderecos <> nil) then
    FreeAndNil(frmCadEnderecos);

  Application.CreateForm(TfrmCadEnderecos, frmCadEnderecos);

  frmCadEnderecos.IniciaTela(QryEnderecosIDENDERECO.AsInteger, 2);

  frmCadEnderecos.ShowModal;
  QryEnderecos.Refresh;
  QryEmpresa.Refresh;
end;

procedure TfrmCadEmpresas.SpdBtnEditarFuncionarioClick(Sender: TObject);
begin
  if (frmCadFuncionarios <> nil) then
    FreeAndNil(frmCadFuncionarios);

  Application.CreateForm(TfrmCadFuncionarios, frmCadFuncionarios);

  frmCadFuncionarios.IniciaTela(QryFuncionariosIDFUNCIONARIO.AsInteger, 2);

  frmCadFuncionarios.ShowModal;
  QryFuncionarios.Refresh;
  QryEmpresa.Refresh;
end;

procedure TfrmCadEmpresas.SpdBtnEditarTitularClick(Sender: TObject);
begin
  if (frmCadTitulares <> nil) then
    FreeAndNil(frmCadTitulares);

  Application.CreateForm(TfrmCadTitulares, frmCadTitulares);

  if (Length(QryTitularesNUCNPJCPF.AsString) = 18) then
    frmCadTitulares.IniciaTela('J', QryTitularesIDTITULAR.AsInteger)
  else
    frmCadTitulares.IniciaTela('F', QryTitularesIDTITULAR.AsInteger);

  frmCadTitulares.ShowModal;
  QryTitulares.Refresh;
  QryEmpresa.Refresh;
end;

procedure TfrmCadEmpresas.SpdBtnExcluirClick(Sender: TObject);
var
  NMEMPRESA, IDEMPRESA: string;
begin
  if (QryEmpresa.RecordCount > 0) then
  begin
    NMEMPRESA := QryEmpresaNMEMPRESA.AsString;
    IDEMPRESA := QryEmpresaIDEMPRESA.AsString;
    if frmPrincipal.Pergunta('Deseja realmente excluir a empresa ''' + NMEMPRESA
      + ''', código (' + IDEMPRESA + ')?' + Chr(13) + Chr(13) +
      'Atenção! Essa ação irá excluir todos os titulares, funcionários e endereços vinculados à empresa!')
    then
    begin
      try
        frmPrincipal.ConnPrincipal.StartTransaction;
        ExcluiEmpresa('CADEMPRESA');
        ExcluiEmpresa('CADFUNCIONARIOS');
        ExcluiEmpresa('CADTITULAR');
        ExcluiEmpresa('CADENDERECOS');
        frmPrincipal.ConnPrincipal.Commit;
      except
        on e: Exception do
        begin
          frmPrincipal.ConnPrincipal.Rollback;
          frmPrincipal.Erro('Erro ao processar a exclusão!' + Chr(13) + Char(13)
            + e.Message);
          Exit;
        end;
      end;

      frmPrincipal.Informacao('Excluído com sucesso!');
      PgControl.ActivePage := TabDadosEmpresa;
      EdtCodEmpresa.Clear;
      QryEmpresa.Close;
      QryTitulares.Close;
      QryFuncionarios.Close;
      QryEnderecos.Close;
    end
    else
      frmPrincipal.Informacao('Operação cancelada.')
  end;
end;

procedure TfrmCadEmpresas.SpdBtnExcluirEnderecoClick(Sender: TObject);
begin
  if frmPrincipal.Pergunta
    ('Você realmente deseja excluir o seguinte endereço?' + Chr(13) + Chr(13)
    + 'Código: ' + QryEnderecosIDENDERECO.AsString + Chr(13) +
    'Endereço: ' + QryEnderecosNMENDERECO.AsString) then
  begin
    QryEnderecos.Edit;
    QryEnderecosSTEXCLUIDO.AsString := 'S';
    QryEnderecosDTEXCLUIDO.AsDateTime := Date;

    try
      frmPrincipal.ConnPrincipal.StartTransaction;
      QryEnderecos.Post;
      frmPrincipal.ConnPrincipal.Commit;
    except
      on e: Exception do
      begin
        frmPrincipal.ConnPrincipal.Rollback;
        frmPrincipal.Erro('Ocorreu um erro ao excluir o endereço!' + Chr(13)
          + Chr(13) + e.Message);
        Exit;
      end;
    end;

    frmPrincipal.Informacao('Endereço excluído com sucesso!');
    QryEnderecos.Refresh;
    QryEmpresa.Refresh;
  end;
end;

procedure TfrmCadEmpresas.SpdBtnExcluirFuncionarioClick(Sender: TObject);
begin
  if frmPrincipal.Pergunta
    ('Você realmente deseja excluir o seguinte funcionário?' + Chr(13) + Chr(13)
    + 'Código: ' + QryFuncionariosIDFUNCIONARIO.AsString + Chr(13) +
    'Funcionário: ' + QryFuncionariosNMFUNCIONARIO.AsString) then
  begin
    QryFuncionarios.Edit;
    QryFuncionariosSTEXCLUIDO.AsString := 'S';
    QryFuncionariosDTEXCLUIDO.AsDateTime := Date;

    try
      frmPrincipal.ConnPrincipal.StartTransaction;
      QryFuncionarios.Post;
      frmPrincipal.ConnPrincipal.Commit;
    except
      on e: Exception do
      begin
        frmPrincipal.ConnPrincipal.Rollback;
        frmPrincipal.Erro('Ocorreu um erro ao excluir o funcionário!' + Chr(13)
          + Chr(13) + e.Message);
        Exit;
      end;
    end;

    frmPrincipal.Informacao('Funcionário excluído com sucesso!');
    QryFuncionarios.Refresh;
    QryEmpresa.Refresh;
  end;
end;

procedure TfrmCadEmpresas.SpdBtnExcluirTitularClick(Sender: TObject);
begin
  if frmPrincipal.Pergunta('Você realmente deseja excluir o seguinte titular?' +
    Chr(13) + Chr(13) + 'Código: ' + QryTitularesIDTITULAR.AsString + Chr(13) +
    'Nome: ' + QryTitularesNMTITULAR.AsString) then
  begin
    QryTitulares.Edit;
    QryTitularesSTEXCLUIDO.AsString := 'S';
    QryTitularesDTEXCLUIDO.AsDateTime := Date;

    try
      frmPrincipal.ConnPrincipal.StartTransaction;
      QryTitulares.Post;
      frmPrincipal.ConnPrincipal.Commit;
    except
      on e: Exception do
      begin
        frmPrincipal.ConnPrincipal.Rollback;
        frmPrincipal.Erro('Ocorreu um erro ao excluir o titular!' + Chr(13) +
          Chr(13) + e.Message);
        Exit;
      end;
    end;

    frmPrincipal.Informacao('Titular excluído com sucesso!');
    QryTitulares.Refresh;
    QryEmpresa.Refresh;
  end;
end;

procedure TfrmCadEmpresas.ExcluiEmpresa(Tabela: string);
var
  IndexRef01: Integer;
begin
  IndexRef01 := QryExcluiEmpresa.SQL.IndexOf('--<REF 01>') + 1;
  QryExcluiEmpresa.Close;
  QryExcluiEmpresa.SQL[IndexRef01] := Tabela;
  QryExcluiEmpresa.ParamByName('COD_EMPRESA').AsInteger :=
    QryEmpresaIDEMPRESA.AsInteger;
  QryExcluiEmpresa.ExecSQL;
end;

procedure TfrmCadEmpresas.SpdBtnNovoClick(Sender: TObject);
begin
  if (QryEmpresa.Active = False) then
  begin
    QryEmpresa.ParamByName('COD_EMPRESA').AsInteger := -1;
    QryEmpresa.Open;
  end;

  QryEmpresa.Insert;

  QryEmpresaDTCADASTRO.AsDateTime := Date;
  DtCadastro.Date := Date;
  QryEmpresaSTEXCLUIDO.AsString := 'N';
  QryEmpresaSTATIVO.AsString := 'S';

  SpdBtnNovo.Enabled := False;
  SpdBtnEditar.Enabled := False;
  SpdBtnExcluir.Enabled := False;
  EdtCodEmpresa.Enabled := False;

  PgControl.ActivePage := TabDadosEmpresa;
  TabDadosEmpresa.Enabled := True;

  DBLblEdtNMEMPRESA.Enabled := True;
  SpdBtnSalvar.Enabled := True;
  SpdBtnCancelar.Enabled := True;

  DBChkAtiva.ReadOnly := False;

end;

procedure TfrmCadEmpresas.SpdBtnNovoEnderecoClick(Sender: TObject);
begin
  if (frmCadEnderecos <> nil) then
    FreeAndNil(frmCadEnderecos);

  Application.CreateForm(TfrmCadEnderecos, frmCadEnderecos);

  frmCadEnderecos.IniciaTela(QryEmpresaIDEMPRESA.AsInteger, 1);

  frmCadEnderecos.ShowModal;
  QryEnderecos.Refresh;
  QryEmpresa.Refresh;
  if QryEnderecos.RecordCount > 0 then
  begin
    SpdBtnExcluirEndereco.Enabled := True;
    SpdBtnEditarEndereco.Enabled := True;
  end;
end;

procedure TfrmCadEmpresas.SpdBtnNovoFuncionarioClick(Sender: TObject);
begin
  if (frmCadFuncionarios <> nil) then
    FreeAndNil(frmCadFuncionarios);

  Application.CreateForm(TfrmCadFuncionarios, frmCadFuncionarios);

  frmCadFuncionarios.IniciaTela(QryEmpresaIDEMPRESA.AsInteger, 1);

  frmCadFuncionarios.ShowModal;
  QryFuncionarios.Refresh;
  QryEmpresa.Refresh;
  if QryFuncionarios.RecordCount > 0 then
  begin
    SpdBtnExcluirFuncionario.Enabled := True;
    SpdBtnEditarFuncionario.Enabled := True;
  end;
end;

procedure TfrmCadEmpresas.SpdBtnNovoTitularClick(Sender: TObject);
begin
  if (frmCadTitulares <> nil) then
    FreeAndNil(frmCadTitulares);

  Application.CreateForm(TfrmCadTitulares, frmCadTitulares);
  frmCadTitulares.IniciaTela(QryEmpresaIDEMPRESA.AsInteger);
  frmCadTitulares.ShowModal;
  QryTitulares.Refresh;
  QryEmpresa.Refresh;
end;

procedure TfrmCadEmpresas.SpdBtnSalvarClick(Sender: TObject);
var
  Tipo, RetornoValidacao: Integer;
  Inserindo: Boolean;
begin
  if (QryEmpresa.State in ([dsInsert])) then
    Inserindo := True
  else
    Inserindo := False;

  if (Inserindo) then
  begin
    NovoID := frmPrincipal.ObterMax('CADEMPRESA', 'IDEMPRESA');

    QryEmpresaIDEMPRESA.AsInteger := NovoID;
  end;

  try
    frmPrincipal.ConnPrincipal.StartTransaction;
    QryEmpresa.Post;
    frmPrincipal.ConnPrincipal.Commit;
  except
    on e: Exception do
    begin
      frmPrincipal.ConnPrincipal.Rollback;
      frmPrincipal.Erro('Erro ao salvar dados!' + Chr(13) + e.Message);
      Exit;
    end;
  end;

  if (Inserindo) then
    frmPrincipal.Informacao('Empresa cadastrada com sucesso sob o código (' +
      IntToStr(NovoID) + ')!')
  else
    frmPrincipal.Informacao('Dados da empresa (' + QryEmpresaIDEMPRESA.AsString
      + ') atualizados com sucesso!');

  TabTitulares.Enabled := True;
  TabEnderecos.Enabled := True;
  TabFuncionarios.Enabled := True;
  SpdBtnCancelar.Click;
end;

procedure TfrmCadEmpresas.TabEnderecosShow(Sender: TObject);
begin
  if (QryEmpresa.State in ([dsEdit, dsInsert])) then
  begin
    QryEnderecos.Close;
    frmPrincipal.Alerta
      ('Você deve finalizar as opções no cadastro da empresa para poder manusear os dados dos Endereços!');
    SpdBtnNovoEndereco.Enabled := False;
    SpdBtnEditarEndereco.Enabled := False;
    SpdBtnExcluirEndereco.Enabled := False;
    Exit;
  end;
  if (QryEmpresa.RecordCount > 0) then
  begin
    QryEnderecos.Close;
    QryEnderecos.ParamByName('COD_EMPRESA').AsInteger :=
      QryEmpresaIDEMPRESA.AsInteger;
    QryEnderecos.Open;
    SpdBtnNovoEndereco.Enabled := True;
    if (QryEnderecos.RecordCount > 0) then
    begin
      SpdBtnEditarEndereco.Enabled := True;
      SpdBtnExcluirEndereco.Enabled := True;
    end;
  end;
end;

procedure TfrmCadEmpresas.TabFuncionariosShow(Sender: TObject);
begin
  if (QryEmpresa.State in ([dsEdit, dsInsert])) then
  begin
    QryFuncionarios.Close;
    frmPrincipal.Alerta
      ('Você deve finalizar as opções no cadastro da empresa para poder manusear os dados dos Funcionários!');
    SpdBtnNovoFuncionario.Enabled := False;
    SpdBtnEditarFuncionario.Enabled := False;
    SpdBtnExcluirFuncionario.Enabled := False;
    Exit;
  end;
  if (QryEmpresa.RecordCount > 0) then
  begin
    QryFuncionarios.Close;
    QryFuncionarios.ParamByName('COD_EMPRESA').AsInteger :=
      QryEmpresaIDEMPRESA.AsInteger;
    QryFuncionarios.Open;
    SpdBtnNovoFuncionario.Enabled := True;
    if (QryFuncionarios.RecordCount > 0) then
    begin
      SpdBtnEditarFuncionario.Enabled := True;
      SpdBtnExcluirFuncionario.Enabled := True;
    end;
  end;
end;

procedure TfrmCadEmpresas.TabTitularesShow(Sender: TObject);
begin
  if (QryEmpresa.State in ([dsEdit, dsInsert])) then
  begin
    QryTitulares.Close;
    frmPrincipal.Alerta
      ('Você deve finalizar as opções no cadastro da empresa para poder manusear os dados dos Titulares!');
    SpdBtnNovoTitular.Enabled := False;
    SpdBtnEditarTitular.Enabled := False;
    SpdBtnExcluirTitular.Enabled := False;
    Exit;
  end;
  if (QryEmpresa.RecordCount > 0) then
  begin
    QryTitulares.Close;
    QryTitulares.ParamByName('COD_EMPRESA').AsInteger :=
      QryEmpresaIDEMPRESA.AsInteger;
    QryTitulares.Open;
    SpdBtnNovoTitular.Enabled := True;
    if (QryTitulares.RecordCount > 0) then
    begin
      SpdBtnEditarTitular.Enabled := True;
      SpdBtnExcluirTitular.Enabled := True;
    end;
  end;
end;

procedure TfrmCadEmpresas.AbrirPesquisa;
var
  IDEMPRESA: Integer;
begin
  if frmPesquisaEmpresa = nil then
    Application.CreateForm(TfrmPesquisaEmpresa, frmPesquisaEmpresa);

  frmPesquisaEmpresa.ShowModal;
  if (frmPesquisaEmpresa.Tag = 1) then
    IDEMPRESA := frmPesquisaEmpresa.RetornaSelecao;

  IF (IDEMPRESA > 0) and (frmPesquisaEmpresa.Tag = 1) then
  begin
    EdtCodEmpresa.Text := IntToStr(IDEMPRESA);
    PesquisaEmpresa;
  end
  else
  begin
    SpdBtnExcluir.Enabled := False;
    SpdBtnEditar.Enabled := False;
    TabTitulares.Enabled := False;
    TabEnderecos.Enabled := False;
    TabFuncionarios.Enabled := False;
  end;
  FreeAndNil(frmPesquisaEmpresa);
end;

procedure TfrmCadEmpresas.DBGridEnderecosDblClick(Sender: TObject);
begin
  SpdBtnEditarEndereco.Click;
end;

procedure TfrmCadEmpresas.DBGridFuncionariosDblClick(Sender: TObject);
begin
  SpdBtnEditarFuncionario.Click;
end;

procedure TfrmCadEmpresas.DBGridTitularesDblClick(Sender: TObject);
begin
  SpdBtnEditarTitular.Click;
end;

procedure TfrmCadEmpresas.EdtCodEmpresaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Char(Key) = #13) or (Char(Key) = #9) then
    PesquisaEmpresa;
end;

procedure TfrmCadEmpresas.EdtCodEmpresaRightButtonClick(Sender: TObject);
begin
  AbrirPesquisa;
end;

procedure TfrmCadEmpresas.FormShow(Sender: TObject);
begin
  PgControl.ActivePage := TabDadosEmpresa;
end;

end.
