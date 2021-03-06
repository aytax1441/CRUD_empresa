unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Vcl.Menus, Data.DB,
  FireDAC.Comp.Client, System.UITypes, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.StdCtrls, System.ImageList, Vcl.ImgList, Vcl.Buttons,
  Vcl.Mask, Vcl.ExtDlgs;

type
  TfrmPrincipal = class(TForm)
    ConnPrincipal: TFDConnection;
    MenuPrincipal: TMainMenu;
    Cadastros1: TMenuItem;
    Cadastros2: TMenuItem;
    Localidades1: TMenuItem;
    QryMaxID: TFDQuery;
    QryMaxIDIDMAX: TLargeintField;
    OpenFile: TOpenTextFileDialog;
    LblEdtCaminhoBanco: TLabeledEdit;
    SpdBtnAlterar: TSpeedButton;
    ImagensBotoes: TImageList;
    Label1: TLabel;
    ImgON: TImage;
    ImgOFF: TImage;
    LblStatusConexao: TLabel;
    SpdBtnConexao: TSpeedButton;
    LblEdtDBUser_Name: TLabeledEdit;
    LblEdtDBPassword: TLabeledEdit;
    SpdBtnSalvar: TSpeedButton;
    procedure Cadastros2Click(Sender: TObject);
    procedure Localidades1Click(Sender: TObject);
    procedure SpdBtnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpdBtnConexaoClick(Sender: TObject);
    procedure SpdBtnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    ArquivoBD: TextFile;
    procedure ToggleConexao(IndAtiva : Boolean);
  public
    { Public declarations }
    procedure Alerta(Texto: string);
    procedure Erro(Texto: string);
    procedure Informacao(Texto: string);
    function Pergunta(Texto: string): Boolean overload;
    function Pergunta(Texto: string; IndAlerta: Boolean): Boolean overload;
    function ObterMax(Tabela, Campo: string): Integer;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uFrmCadEmpresas, uFrmCadLocalidades;

procedure TfrmPrincipal.ToggleConexao(IndAtiva: Boolean);
begin
  if IndAtiva then
  begin
    ImgOFF.Visible := False;
    ImgON.Visible := True;
    LblStatusConexao.Caption := 'CONECTADO';
    SpdBtnConexao.Tag := 1;
    SpdBtnConexao.ImageIndex := 3;
    SpdBtnConexao.Caption := 'DESCONECTAR';
    Cadastros1.Enabled := True;
  end
  else
  begin
    ImgOFF.Visible := True;
    ImgON.Visible := False;
    LblStatusConexao.Caption := 'DESCONECTADO';
    SpdBtnConexao.Tag := 0;
    SpdBtnConexao.ImageIndex := 2;
    SpdBtnConexao.Caption := 'CONECTAR';
    Cadastros1.Enabled := False;
  end;
end;
function TfrmPrincipal.ObterMax(Tabela: string; Campo: string): Integer;
var
  IndexRef01, IndexRef02: Integer;
begin
  // Ref 01 = Campo da tabela
  // Ref 02 =  Nome da tabela
  IndexRef01 := QryMaxID.SQL.IndexOf('--<REF 01>') + 1;
  IndexRef02 := QryMaxID.SQL.IndexOf('--<REF 02>') + 1;
  QryMaxID.Close;

  QryMaxID.SQL[IndexRef01] := Campo;
  QryMaxID.SQL[IndexRef02] := Tabela;

  QryMaxID.Open;

  if QryMaxIDIDMAX.AsInteger = 0 then
    Result := 1
  else
    Result := QryMaxIDIDMAX.AsInteger;
end;

procedure TfrmPrincipal.Cadastros2Click(Sender: TObject);
begin
  if (frmCadEmpresas <> nil) then
    FreeAndNil(frmCadEmpresas);

  Application.CreateForm(TfrmCadEmpresas, frmCadEmpresas);
  frmCadEmpresas.ShowModal;
  FreeAndNil(frmCadEmpresas);
end;

procedure TfrmPrincipal.Alerta(Texto: string);
begin
  MessageDlg(Texto, TMsgDlgType.mtWarning, [mbOK], 0);
end;

procedure TfrmPrincipal.Erro(Texto: string);
begin
  MessageDlg(Texto, mtError, [mbOK], 0);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
var
  CaminhoInicial: TStringList;
  Texto: string;
  Contador: Integer;
begin
  AssignFile(ArquivoBD, ExtractFileDir(Application.ExeName) + '\BD.conf');
  try
    Reset(ArquivoBD);
  except
    CaminhoInicial := TStringList.Create;
    CaminhoInicial.Add('C:\DADOS.FDB');
    CaminhoInicial.Add('SYSDBA');
    CaminhoInicial.Add('masterkey');
    CaminhoInicial.SaveToFile(ExtractFileDir(Application.ExeName) + '\BD.conf');
    AssignFile(ArquivoBD, ExtractFileDir(Application.ExeName) + '\BD.conf');
    Reset(ArquivoBD);
  end;

  Contador := 0;
  ConnPrincipal.Params.Clear;
  ConnPrincipal.Params.Add('DriverID=FB');
  while not Eof(ArquivoBD) do
  begin
    ReadLn(ArquivoBD, Texto);
    case Contador of
      0:
        begin
          ConnPrincipal.Params.Add('Database=' + Texto);
          LblEdtCaminhoBanco.Text := Texto;
        end;
      1:
        begin
          ConnPrincipal.Params.Add('User_Name=' + Texto);
          LblEdtDBUser_Name.Text := Texto;
        end;
    else
      ConnPrincipal.Params.Add('Password=' + Texto);
      LblEdtDBPassword.Text := Texto;
    end;

    Inc(Contador);
  end;

  CloseFile(ArquivoBD);

  try
    ConnPrincipal.Connected := True;
  except
  end;
  {$IFDEF DEBUG}
    LblEdtCaminhoBanco.Visible := True;
    LblEdtDBUser_Name.Visible := True;
    LblEdtDBPassword.Visible := True;
    SpdBtnAlterar.Visible := True;
    SpdBtnSalvar.Visible := True;
  {$ELSE}
    LblEdtCaminhoBanco.Visible := False;
    LblEdtDBUser_Name.Visible := False;
    LblEdtDBPassword.Visible := False;
    SpdBtnAlterar.Visible := False;
    SpdBtnSalvar.Visible := False;
  {$ENDIF}
  ToggleConexao(ConnPrincipal.Connected);
end;

procedure TfrmPrincipal.Informacao(Texto: string);
begin
  MessageDlg(Texto, mtInformation, [mbOK], 0);
end;

procedure TfrmPrincipal.Localidades1Click(Sender: TObject);
begin
  if (frmCadLocalidades <> nil) then
    FreeAndNil(frmCadLocalidades);

  Application.CreateForm(TfrmCadLocalidades, frmCadLocalidades);
  frmCadLocalidades.ShowModal;
  FreeAndNil(frmCadLocalidades);
end;

function TfrmPrincipal.Pergunta(Texto: string): Boolean;
begin
  if MessageDlg(Texto, mtConfirmation, [mbYes, mbNo], 0, mbNo) = mrYes then
    Result := True
  else
    Result := False;
end;

function TfrmPrincipal.Pergunta(Texto: string; IndAlerta: Boolean): Boolean;
begin
  if MessageDlg(Texto, mtWarning, [mbYes, mbNo], 0, mbNo) = mrYes then
    Result := True
  else
    Result := False;
end;

procedure TfrmPrincipal.SpdBtnAlterarClick(Sender: TObject);
var
  ConteudoArquivo: TStringList;
  Texto: string;
  Index: Integer;
begin
  OpenFile.Execute;
  LblEdtCaminhoBanco.Text := OpenFile.FileName;

  ConteudoArquivo := TStringList.Create;
  Reset(ArquivoBD);
  while not Eof(ArquivoBD) do
  begin
    ReadLn(ArquivoBD, Texto);
    ConteudoArquivo.Add(Texto);
  end;

  Rewrite(ArquivoBD);
  Writeln(ArquivoBD, OpenFile.FileName);
  for Index := 1 to ConteudoArquivo.Count - 1 do
  begin
    Writeln(ArquivoBD, ConteudoArquivo[Index]);
  end;
  CloseFile(ArquivoBD);

  ConnPrincipal.Connected := False;
  ToggleConexao(ConnPrincipal.Connected);
end;

procedure TfrmPrincipal.SpdBtnConexaoClick(Sender: TObject);
var
  Texto: string;
  Contador: Integer;
begin
  if SpdBtnConexao.Tag = 1 then
  begin
    ConnPrincipal.Connected := False;
    ToggleConexao(ConnPrincipal.Connected);
  end
  else
  begin
    Reset(ArquivoBD);
    Contador := 0;
    ConnPrincipal.Params.Clear;
    ConnPrincipal.Params.Add('DriverID=FB');
    while not Eof(ArquivoBD) do
    begin
      ReadLn(ArquivoBD, Texto);
      case Contador of
        0:
          begin
            ConnPrincipal.Params.Add('Database=' + Texto);
            LblEdtCaminhoBanco.Text := Texto;
          end;
        1:
          ConnPrincipal.Params.Add('User_Name=' + Texto);
      else
        ConnPrincipal.Params.Add('Password=' + Texto);
      end;

      Inc(Contador);
    end;

    CloseFile(ArquivoBD);
    try
      ConnPrincipal.Connected := True;
    except
    on e: Exception do
    begin
      Erro('Erro ao abrir a conex?o com o banco de dados!' + Chr(13) + Chr(13) + e.Message);
    end;
    end;

    ToggleConexao(ConnPrincipal.Connected);
  end;

end;

procedure TfrmPrincipal.SpdBtnSalvarClick(Sender: TObject);
begin
  Rewrite(ArquivoBD);
  Writeln(ArquivoBD, LblEdtCaminhoBanco.Text);
  Writeln(ArquivoBD, LblEdtDBUser_Name.Text);
  Writeln(ArquivoBD, LblEdtDBPassword.Text);
  CloseFile(ArquivoBD);
  Informacao('Alterado com sucesso.');
  ConnPrincipal.Connected := False;
  ToggleConexao(ConnPrincipal.Connected);
end;

end.
