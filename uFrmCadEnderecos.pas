unit uFrmCadEnderecos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons;

type
  TfrmCadEnderecos = class(TForm)
    ImgsBotoes: TImageList;
    QryCidade: TFDQuery;
    QryCidadeIDCIDADE: TIntegerField;
    QryCidadeNMCIDADE: TStringField;
    QryCidadeIDUF: TIntegerField;
    QryCidadeNOIBGE: TStringField;
    DsCidade: TDataSource;
    QryEstado: TFDQuery;
    QryEstadoIDUF: TIntegerField;
    QryEstadoNMESTADO: TStringField;
    QryEstadoSGESTADO: TStringField;
    DsEstado: TDataSource;
    QryEndereco: TFDQuery;
    PnlCabecalho: TPanel;
    PnlCorpo: TPanel;
    PnlRodape: TPanel;
    EdtCodUF: TButtonedEdit;
    Label6: TLabel;
    Label5: TLabel;
    DBLkpCbbUF: TDBLookupComboBox;
    Label3: TLabel;
    EdtCodCidade: TButtonedEdit;
    Label4: TLabel;
    DBLkpCbbCidade: TDBLookupComboBox;
    DBLblEdtNMENDERECO: TDBLabeledEdit;
    DBLblEdtNUENDERECO: TDBLabeledEdit;
    DBLblEdtNMBAIRRO: TDBLabeledEdit;
    DBLblEdtNUCEP: TDBLabeledEdit;
    SpdBtnCancelar: TSpeedButton;
    SpdBtnSalvar: TSpeedButton;
    DbChkAtivo: TDBCheckBox;
    Label1: TLabel;
    DBTxIDENDERECO: TDBText;
    Label2: TLabel;
    DBTxNMEMPRESA: TDBText;
    QryEnderecoIDENDERECO: TIntegerField;
    QryEnderecoIDTITULAR: TIntegerField;
    QryEnderecoIDEMPRESA: TIntegerField;
    QryEnderecoNMENDERECO: TStringField;
    QryEnderecoNUENDERECO: TStringField;
    QryEnderecoNMBAIRRO: TStringField;
    QryEnderecoIDCIDADE: TIntegerField;
    QryEnderecoIDUF: TIntegerField;
    QryEnderecoNUCEP: TStringField;
    QryEnderecoSTATIVO: TStringField;
    QryEnderecoSTEXCLUIDO: TStringField;
    QryEnderecoDTEXCLUIDO: TDateField;
    QryEnderecoTPCADASTRO: TStringField;
    DsEndereco: TDataSource;
    QryEmpresa: TFDQuery;
    QryEmpresaNMEMPRESA: TStringField;
    DsEmpresa: TDataSource;
    QryEnderecosAtivos: TFDQuery;
    QryEnderecosAtivosIDENDERECO: TIntegerField;
    QryEnderecosAtivosSTATIVO: TStringField;
    QryEnderecosAtivosNMENDERECO: TStringField;
    QryEnderecosAtivosNUENDERECO: TStringField;
    procedure EdtCodUFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodUFRightButtonClick(Sender: TObject);
    procedure EdtCodCidadeRightButtonClick(Sender: TObject);
    procedure QryEnderecoIDUFChange(Sender: TField);
    procedure QryEnderecoIDCIDADEChange(Sender: TField);
    procedure EdtCodCidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure SpdBtnCancelarClick(Sender: TObject);
    procedure SpdBtnSalvarClick(Sender: TObject);
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
  frmCadEnderecos: TfrmCadEnderecos;

implementation

{$R *.dfm}

uses uFrmPrincipal, uFrmPesquisaCidade, uFrmPesquisaEstado;

procedure TfrmCadEnderecos.IniciaTela(Codigo: Integer; TipoCodigo: Integer);
begin
  // TipoCodigo
  // #1 - Código da Empresa (Cadastrando novo endereço);
  // #2 - Código do Endereço (Editando cadastro existente)
  QryEndereco.Close;
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
    QryEndereco.ParamByName('COD_ENDERECO').AsInteger := -1;
    QryEndereco.Open;
    QryEndereco.Insert;

    QryEnderecoIDEMPRESA.AsInteger := Codigo;
    QryEnderecoSTEXCLUIDO.AsString := 'N';
    QryEnderecoSTATIVO.AsString := 'S';

    QryEmpresa.ParamByName('COD_EMPRESA').AsInteger := Codigo;
    QryEmpresa.Open;
  end
  else
  begin
    QryEndereco.ParamByName('COD_ENDERECO').AsInteger := Codigo;
    QryEndereco.Open;
    QryEndereco.Edit;

    EdtCodCidade.Text := QryEnderecoIDCIDADE.AsString;
    EdtCodUF.Text := QryEnderecoIDUF.AsString;

    QryEmpresa.ParamByName('COD_EMPRESA').AsInteger :=
      QryEnderecoIDEMPRESA.AsInteger;
    QryEmpresa.Open;
  end;
end;

procedure TfrmCadEnderecos.EdtCodCidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Char(Key) = #13 then
  begin
    if (EdtCodCidade.Text <> '') and (EdtCodCidade.Text <> '0') then
      SelecionaCidade
    else
    begin
      QryCidade.Close;
      if QryEnderecoIDUF.AsInteger = 0 then
        QryCidade.ParamByName('COD_UF').AsInteger := 0
      else if QryCidade.ParamByName('COD_UF').AsInteger <> QryEnderecoIDUF.AsInteger
      then
        QryCidade.ParamByName('COD_UF').AsInteger := QryEnderecoIDUF.AsInteger;

      QryCidade.ParamByName('COD_CIDADE').AsInteger := 0;
      QryCidade.Open;

      if QryCidade.RecordCount > 0 then
        DBLkpCbbCidade.Enabled := True
      else
        DBLkpCbbCidade.Enabled := False;

      QryEnderecoIDCIDADE.Clear;
    end;
  end;
end;

procedure TfrmCadEnderecos.EdtCodCidadeRightButtonClick(Sender: TObject);
begin
  AbrePesquisa(2);
end;

procedure TfrmCadEnderecos.EdtCodUFKeyDown(Sender: TObject; var Key: Word;
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

      QryEnderecoIDUF.Clear;
      QryEnderecoIDCIDADE.Clear;
    end;
  end;
end;

procedure TfrmCadEnderecos.EdtCodUFRightButtonClick(Sender: TObject);
begin
  AbrePesquisa(1);
end;

procedure TfrmCadEnderecos.FormShow(Sender: TObject);
begin
  QryEndereco.Edit;
end;

procedure TfrmCadEnderecos.QryEnderecoIDCIDADEChange(Sender: TField);
begin
  EdtCodCidade.Text := QryEnderecoIDCIDADE.AsString;
  if (QryEnderecoIDCIDADE.AsInteger <> 0) and (EdtCodCidade.Text <> '') then
    SelecionaCidade;
end;

procedure TfrmCadEnderecos.QryEnderecoIDUFChange(Sender: TField);
begin
  EdtCodUF.Text := QryEnderecoIDUF.AsString;
  QryCidade.Close;
  QryCidade.ParamByName('COD_UF').AsInteger := QryEnderecoIDUF.AsInteger;
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

procedure TfrmCadEnderecos.SelecionaEstado;
begin

  QryEstado.Close;
  QryEstado.ParamByName('COD_UF').AsInteger := StrToInt(EdtCodUF.Text);
  QryEstado.Open;

  if QryEstado.RecordCount > 0 then
  begin
    QryEnderecoIDUF.AsInteger := QryEstadoIDUF.AsInteger;
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
      QryEnderecoIDCIDADE.Clear;
      Exit;
    end;
  end
  else
    AbrePesquisa(1);
end;

procedure TfrmCadEnderecos.SelecionaEstado(CodCidade: Integer);
begin
  QryEstado.Close;
  QryEstado.ParamByName('COD_UF').AsInteger := QryCidadeIDUF.AsInteger;
  QryEstado.Open;

  QryEnderecoIDUF.AsInteger := QryCidadeIDUF.AsInteger;
end;

procedure TfrmCadEnderecos.SpdBtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadEnderecos.SpdBtnSalvarClick(Sender: TObject);
var
  NovoID, IDValidacao: Integer;
begin
  if QryEnderecoSTATIVO.AsString = 'S' then
  begin
    QryEnderecosAtivos.Close;
    QryEnderecosAtivos.ParamByName('COD_EMPRESA').AsInteger :=
      QryEnderecoIDEMPRESA.AsInteger;
    QryEnderecosAtivos.Open;

    if QryEnderecosAtivos.RecordCount > 0 then
    begin
      if (QryEnderecosAtivosIDENDERECO.AsInteger <>
        QryEnderecoIDENDERECO.AsInteger) OR (QryEndereco.State in ([dsInsert]))
      then
      begin
        if frmPrincipal.Pergunta
          ('O endereço que está sendo cadastrado/modificado está como ativo. Entretanto, já há outro endereço ativo para essa empresa! Você deseja tornar o cadastro atual o único ativo?'
          + Chr(13) +
          'Caso a resposta for "SIM", o outro cadastro será inativado. Caso for "NÃO", esse será inativado e irá manter o outro ativo.'
          + Chr(13) + Chr(13) + 'Cadastro Ativo Atualmente:' + Chr(13) +
          'Logradouro: ' + QryEnderecosAtivosNMENDERECO.AsString + Chr(13) +
          'Número: ' + QryEnderecosAtivosNUENDERECO.AsString + Chr(13) + Chr(13)
          + 'Cadastro Atual:' + Chr(13) + 'Logradouro: ' +
          QryEnderecoNMENDERECO.AsString + Chr(13) + 'Número: ' +
          QryEnderecoNUENDERECO.AsString) then
        begin
          QryEnderecosAtivos.Edit;
          QryEnderecosAtivosSTATIVO.AsString := 'N';
          try
            frmPrincipal.ConnPrincipal.StartTransaction;
            QryEnderecosAtivos.Post;
            frmPrincipal.ConnPrincipal.Commit;
          except
            on e: Exception do
            begin
              frmPrincipal.ConnPrincipal.Rollback;
              frmPrincipal.Erro('Ocorreu um erro ao inativar o cadastro antigo!' +
                Chr(13) + Chr(13) + e.Message);
              Exit;
            end;
          end;
        end
        else
          QryEnderecoSTATIVO.AsString := 'N';

      end;
    end;

  end;
  if (QryEndereco.State in ([dsInsert])) then
  begin
    NovoID := frmPrincipal.ObterMax('CADENDERECOS', 'IDENDERECO');
    QryEnderecoIDENDERECO.AsInteger := NovoID;
    try
      frmPrincipal.ConnPrincipal.StartTransaction;
      QryEndereco.Post;
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

    frmPrincipal.Informacao('Cadastro de endereço feito com sucesso!' + Chr(13)
      + Chr(13) + 'Código: ' + IntToStr(NovoID) + Chr(13) + 'Logradouro: ' +
      QryEnderecoNMENDERECO.AsString + Chr(13) + 'Número: ' +
      QryEnderecoNUENDERECO.AsString + Chr(13) + 'Bairro: ' +
      QryEnderecoNMBAIRRO.AsString);
  end
  else
  begin
    try
      frmPrincipal.ConnPrincipal.StartTransaction;
      QryEndereco.Post;
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

    frmPrincipal.Informacao
      ('Atualização de dados de endereço feito com sucesso!' + Chr(13) + Chr(13)
      + 'Código: ' + QryEnderecoIDENDERECO.AsString + Chr(13) + 'Logradouro: ' +
      QryEnderecoNMENDERECO.AsString + Chr(13) + 'Número: ' +
      QryEnderecoNUENDERECO.AsString + Chr(13) + 'Bairro: ' +
      QryEnderecoNMBAIRRO.AsString);
  end;

  Close;
end;

procedure TfrmCadEnderecos.SelecionaCidade;
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
    if QryEnderecoIDCIDADE.AsInteger <> QryCidadeIDCIDADE.AsInteger then
      QryEnderecoIDCIDADE.AsInteger := QryCidadeIDCIDADE.AsInteger;
  end;
end;

procedure TfrmCadEnderecos.AbrePesquisa(CodPesquisa: Integer);
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

    if (QryEstado.Active = True) and (QryEnderecoIDUF.AsInteger <> 0) then
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
