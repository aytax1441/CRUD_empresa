unit uFrmCadLocalidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ComCtrls,
  System.ImageList, Vcl.ImgList, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmCadLocalidades = class(TForm)
    PnlCabecalho: TPanel;
    Label1: TLabel;
    EdtCodUF: TButtonedEdit;
    DBLblEdtNMESTADO: TDBLabeledEdit;
    PnlCorpo: TPanel;
    PnlRodape: TPanel;
    ImgsBotoes: TImageList;
    SpdBtnNovo: TSpeedButton;
    SpdBtnEditar: TSpeedButton;
    SpdBtnSalvar: TSpeedButton;
    SpdBtnCancelar: TSpeedButton;
    SpdBtnExcluir: TSpeedButton;
    PnlCabecalhoCidades: TPanel;
    SpdBtnEditarCidade: TSpeedButton;
    SpdBtnExcluirCidade: TSpeedButton;
    SpdBtnNovaCidade: TSpeedButton;
    PnlCorpoCidades: TPanel;
    DBGridCidades: TDBGrid;
    QryCidades: TFDQuery;
    QryEstado: TFDQuery;
    DsCidades: TDataSource;
    DsEstado: TDataSource;
    DBLblEdtSGESTADO: TDBLabeledEdit;
    QryEstadoIDUF: TIntegerField;
    QryEstadoNMESTADO: TStringField;
    QryEstadoSGESTADO: TStringField;
    LblQtdCidades: TLabel;
    QryCidadesIDCIDADE: TIntegerField;
    QryCidadesNMCIDADE: TStringField;
    QryCidadesIDUF: TIntegerField;
    QryCidadesNOIBGE: TStringField;
    procedure EdtCodUFRightButtonClick(Sender: TObject);
    procedure EdtCodUFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpdBtnEditarClick(Sender: TObject);
    procedure SpdBtnCancelarClick(Sender: TObject);
    procedure SpdBtnNovoClick(Sender: TObject);
    procedure SpdBtnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpdBtnNovaCidadeClick(Sender: TObject);
    procedure SpdBtnEditarCidadeClick(Sender: TObject);
    procedure SpdBtnExcluirCidadeClick(Sender: TObject);
    procedure SpdBtnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure AbrirPesquisa;
    procedure PesquisaEstado;
  public
    { Public declarations }
  end;

var
  frmCadLocalidades: TfrmCadLocalidades;

implementation

{$R *.dfm}

uses uFrmPrincipal, uFrmPesquisaEstado, uFrmCadCidades;

procedure TfrmCadLocalidades.AbrirPesquisa;
var
  IDUF: Integer;
begin
  if frmPesquisaEstado = nil then
    Application.CreateForm(TfrmPesquisaEstado, frmPesquisaEstado);

  frmPesquisaEstado.ShowModal;
  if (frmPesquisaEstado.Tag = 1) then
    IDUF := frmPesquisaEstado.RetornaSelecao;

  IF (IDUF > 0) and (frmPesquisaEstado.Tag = 1) then
  begin
    EdtCodUF.Text := IntToStr(IDUF);
    PesquisaEstado;
  end
  else
  begin
    SpdBtnExcluir.Enabled := False;
    SpdBtnEditar.Enabled := False;
    SpdBtnNovaCidade.Enabled := False;
  end;
  FreeAndNil(frmPesquisaEstado);
end;

procedure TfrmCadLocalidades.PesquisaEstado;
begin
  if (EdtCodUF.Text <> '') AND (EdtCodUF.Text <> '0') AND
    not(QryEstado.State in ([dsEdit, dsInsert])) then
  begin
    QryEstado.Close;
    QryEstado.ParamByName('COD_UF').AsInteger := StrToInt(EdtCodUF.Text);
    QryEstado.Open;

    if (QryEstado.RecordCount <= 0) then
      AbrirPesquisa
    else
    begin

      QryCidades.Close;
      QryCidades.ParamByName('COD_UF').AsInteger := StrToInt(EdtCodUF.Text);
      QryCidades.Open;
      if QryCidades.RecordCount > 0 then
      begin
        LblQtdCidades.Caption := 'Qtd. Cidades: ' + IntToStr(QryCidades.RecordCount);
        SpdBtnEditarCidade.Enabled := True;
        SpdBtnExcluirCidade.Enabled := True;
      end
      else
      begin
        LblQtdCidades.Caption := '';
        SpdBtnEditarCidade.Enabled := False;
        SpdBtnExcluirCidade.Enabled := False;
      end;
      SpdBtnNovaCidade.Enabled := True;

      SpdBtnEditar.Enabled := True;
      SpdBtnExcluir.Enabled := True;
    end;
  end;
end;

procedure TfrmCadLocalidades.SpdBtnCancelarClick(Sender: TObject);
begin
  QryEstado.Cancel;
  EdtCodUF.Text := QryEstadoIDUF.AsString;

  SpdBtnNovo.Enabled := True;
  if QryEstado.RecordCount > 0 then
  begin
    SpdBtnEditar.Enabled := True;
    SpdBtnExcluir.Enabled := True;
  end;
  EdtCodUF.Enabled := True;

  DBLblEdtNMESTADO.Enabled := False;
  DBLblEdtSGESTADO.Enabled := False;
  SpdBtnSalvar.Enabled := False;
  SpdBtnCancelar.Enabled := False;

  SpdBtnNovaCidade.Enabled := True;
  SpdBtnEditarCidade.Enabled := True;
  SpdBtnExcluirCidade.Enabled := True;
  DBGridCidades.Enabled := True;
end;

procedure TfrmCadLocalidades.SpdBtnEditarCidadeClick(Sender: TObject);
begin
  if (frmCadCidades <> nil) then
    FreeAndNil(frmCadCidades);

  Application.CreateForm(TfrmCadCidades, frmCadCidades);

  // Tag 1 = Novo Cadastro
  frmCadCidades.Tag := 2;
  frmCadCidades.IniciaTela(QryCidadesIDCIDADE.AsInteger);
  frmCadCidades.ShowModal;

  FreeAndNil(frmCadCidades);
  QryCidades.Refresh;
end;

procedure TfrmCadLocalidades.SpdBtnEditarClick(Sender: TObject);
begin
  if (QryEstado.RecordCount > 0) then
  begin
    QryEstado.Edit;

    SpdBtnNovo.Enabled := False;
    SpdBtnEditar.Enabled := False;
    SpdBtnExcluir.Enabled := False;
    EdtCodUF.Enabled := False;

    DBLblEdtNMESTADO.Enabled := True;
    DBLblEdtSGESTADO.Enabled := True;
    SpdBtnSalvar.Enabled := True;
    SpdBtnCancelar.Enabled := True;

    SpdBtnNovaCidade.Enabled := False;
    SpdBtnEditarCidade.Enabled := False;
    SpdBtnExcluirCidade.Enabled := False;
    DBGridCidades.Enabled := False;
  end;
end;

procedure TfrmCadLocalidades.SpdBtnExcluirCidadeClick(Sender: TObject);
begin
  if frmPrincipal.Pergunta('Você realmente deseja excluir a seguinte cidade?' +
    Chr(13) + Chr(13) + 'Código: ' + QryCidadesIDCIDADE.AsString + Chr(13) +
    'Nome: ' + QryCidadesNMCIDADE.AsString, True) then
  begin
    try
      frmPrincipal.ConnPrincipal.StartTransaction;
      QryCidades.Delete;
      frmPrincipal.ConnPrincipal.Commit;
    except
    on e : Exception do
      begin
        frmPrincipal.ConnPrincipal.Rollback;
        frmPrincipal.Erro('Ocorreu um erro ao excluir a cidade!' + Chr(13) + Chr(13) + e.Message);
        Exit;
      end;
    end;
    frmPrincipal.Informacao('Cidade excluída com sucesso!');
    QryCidades.Refresh;

    if QryCidades.RecordCount > 0 then
      LblQtdCidades.Caption := 'Qtd. Cidades: ' + IntToStr(QryCidades.RecordCount)
    else
    begin
      SpdBtnEditarCidade.Enabled := False;
      SpdBtnExcluirCidade.Enabled := False;
      LblQtdCidades.Caption := '';
    end;

  end;
end;

procedure TfrmCadLocalidades.SpdBtnExcluirClick(Sender: TObject);
begin
  if frmPrincipal.Pergunta('Você realmente deseja excluir o seguinte estado? Isso irá excluir juntamente todas as cidades cadastradas nesse estado!' +
    Chr(13) + Chr(13) + 'Código: ' + QryEstadoIDUF.AsString + Chr(13) +
    'Nome: ' + QryEstadoNMESTADO.AsString) then
  begin
    try
      frmPrincipal.ConnPrincipal.StartTransaction;
      QryCidades.First;
      while not QryCidades.Eof do
      begin
        QryCidades.Delete;
        QryCidades.Next;
      end;

      if QryCidades.RecordCount > 0 then
        QryCidades.Delete;
      frmPrincipal.ConnPrincipal.Commit;

      frmPrincipal.ConnPrincipal.StartTransaction;
      QryEstado.Delete;
      frmPrincipal.ConnPrincipal.Commit;
    except
    on e : Exception do
      begin
        frmPrincipal.ConnPrincipal.Rollback;
        frmPrincipal.Erro('Ocorreu um erro ao excluir o estado!' + Chr(13) + Chr(13) + e.Message);
        Exit;
      end;
    end;
    frmPrincipal.Informacao('Estado excluído com sucesso!');
    QryCidades.Refresh;
    LblQtdCidades.Caption := '';
  end;
end;

procedure TfrmCadLocalidades.SpdBtnNovaCidadeClick(Sender: TObject);
begin
  if (frmCadCidades <> nil) then
    FreeAndNil(frmCadCidades);

  Application.CreateForm(TfrmCadCidades, frmCadCidades);

  // Tag 1 = Novo Cadastro
  frmCadCidades.Tag := 1;
  frmCadCidades.IniciaTela(QryEstadoIDUF.AsInteger);
  frmCadCidades.ShowModal;

  FreeAndNil(frmCadCidades);
  if QryCidades.Active then
    QryCidades.Refresh
  else
    QryCidades.Open;

  if QryCidades.RecordCount > 0 then
  begin
    LblQtdCidades.Caption := 'Qtd. Cidades: ' + IntToStr(QryCidades.RecordCount);
    SpdBtnEditarCidade.Enabled := True;
    SpdBtnExcluirCidade.Enabled := True;
  end
  else
    LblQtdCidades.Caption := '';
end;

procedure TfrmCadLocalidades.SpdBtnNovoClick(Sender: TObject);
begin
  if (QryEstado.Active = False) then
  begin
    QryEstado.ParamByName('COD_UF').AsInteger := -1;
    QryEstado.Open;
  end;

  QryEstado.Insert;

  SpdBtnNovo.Enabled := False;
  SpdBtnEditar.Enabled := False;
  SpdBtnExcluir.Enabled := False;
  EdtCodUF.Enabled := False;

  DBLblEdtNMESTADO.Enabled := True;
  DBLblEdtSGESTADO.Enabled := True;
  SpdBtnSalvar.Enabled := True;
  SpdBtnCancelar.Enabled := True;

  QryCidades.Close;
  SpdBtnNovaCidade.Enabled := False;
  SpdBtnEditarCidade.Enabled := False;
  SpdBtnExcluirCidade.Enabled := False;
  DBGridCidades.Enabled := False;
end;

procedure TfrmCadLocalidades.SpdBtnSalvarClick(Sender: TObject);
var
  Inserindo : Boolean;
  NovoID : Integer;
begin
  if (QryEstado.State in ([dsInsert])) then
    Inserindo := True
  else
    Inserindo := False;

  if (Inserindo) then
  begin
    NovoID := frmPrincipal.ObterMax('CADUF', 'IDUF');

    QryEstadoIDUF.AsInteger := NovoID;
  end;

   try
    frmPrincipal.ConnPrincipal.StartTransaction;
    QryEstado.Post;
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
    frmPrincipal.Informacao('UF cadastrada com sucesso sob o código (' +
      IntToStr(NovoID) + ')!')
  else
    frmPrincipal.Informacao('Dados da UF (' + QryEstadoIDUF.AsString
      + ') atualizados com sucesso!');

  QryCidades.Close;
  QryCidades.ParamByName('COD_UF').AsInteger := QryEstadoIDUF.AsInteger;
  QryCidades.Open;
  SpdBtnCancelar.Click;
end;

procedure TfrmCadLocalidades.EdtCodUFKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Char(Key) = #13) or (Char(Key) = #9) then
    PesquisaEstado;
end;

procedure TfrmCadLocalidades.EdtCodUFRightButtonClick(Sender: TObject);
begin
  AbrirPesquisa;
end;

procedure TfrmCadLocalidades.FormShow(Sender: TObject);
begin
  LblQtdCidades.Caption := '';
end;

end.
