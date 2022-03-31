object frmCadFuncionarios: TfrmCadFuncionarios
  Left = 0
  Top = 0
  Caption = 'Cadastro de Funcion'#225'rios'
  ClientHeight = 558
  ClientWidth = 898
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 898
    Height = 49
    Align = alTop
    TabOrder = 0
    object DBTxNMEMPRESA: TDBText
      Left = 353
      Top = 23
      Width = 456
      Height = 20
      DataField = 'NMEMPRESA'
      DataSource = DsEmpresa
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 353
      Top = 8
      Width = 50
      Height = 15
      Caption = 'Empresa:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBTxIDFUNCIONARIO: TDBText
      Left = 80
      Top = 13
      Width = 134
      Height = 20
      DataField = 'IDFUNCIONARIO'
      DataSource = DsFuncionario
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 9
      Width = 66
      Height = 25
      Caption = 'C'#243'digo:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 898
    Height = 468
    Align = alClient
    TabOrder = 1
    object GrpDadosPrincipais: TGroupBox
      Left = 8
      Top = 6
      Width = 433
      Height = 115
      Caption = 'Dados Principais'
      TabOrder = 0
      object DBLblEdtNMFUNCIONARIO: TDBLabeledEdit
        Left = 8
        Top = 42
        Width = 417
        Height = 23
        DataField = 'NMFUNCIONARIO'
        DataSource = DsFuncionario
        TabOrder = 0
        EditLabel.Width = 38
        EditLabel.Height = 15
        EditLabel.Caption = 'Nome*'
      end
      object DBLblEdtDTCADASTRO: TDBLabeledEdit
        Left = 8
        Top = 84
        Width = 114
        Height = 23
        DataField = 'DTCADASTRO'
        DataSource = DsFuncionario
        Enabled = False
        TabOrder = 3
        EditLabel.Width = 90
        EditLabel.Height = 15
        EditLabel.BiDiMode = bdLeftToRight
        EditLabel.Caption = 'Data de Cadastro'
        EditLabel.ParentBiDiMode = False
      end
      object DbChkAtivo: TDBCheckBox
        Left = 317
        Top = 19
        Width = 52
        Height = 17
        Caption = 'Ativo?'
        DataField = 'STATIVO'
        DataSource = DsFuncionario
        TabOrder = 2
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBLblEdtDTNASCIMENTO: TDBLabeledEdit
        Left = 128
        Top = 84
        Width = 114
        Height = 23
        DataField = 'DTNASCIMENTO'
        DataSource = DsFuncionario
        TabOrder = 1
        EditLabel.Width = 107
        EditLabel.Height = 15
        EditLabel.BiDiMode = bdLeftToRight
        EditLabel.Caption = 'Data de Nascimento'
        EditLabel.ParentBiDiMode = False
      end
    end
    object GrpDadosEnderecoContato: TGroupBox
      Left = 8
      Top = 127
      Width = 433
      Height = 335
      Caption = 'Endere'#231'o e Contato'
      TabOrder = 2
      object GrpContato: TGroupBox
        Left = 3
        Top = 20
        Width = 427
        Height = 119
        Caption = 'Contato'
        TabOrder = 0
        object DBLblEdtTXEMAIL: TDBLabeledEdit
          Left = 150
          Top = 40
          Width = 272
          Height = 23
          DataField = 'TXEMAIL'
          DataSource = DsFuncionario
          TabOrder = 1
          EditLabel.Width = 34
          EditLabel.Height = 15
          EditLabel.Caption = 'E-mail'
        end
        object DBLblEdtTLRESIDENCIAL: TDBLabeledEdit
          Left = 8
          Top = 40
          Width = 136
          Height = 23
          DataField = 'TLRESIDENCIAL'
          DataSource = DsFuncionario
          TabOrder = 0
          EditLabel.Width = 106
          EditLabel.Height = 15
          EditLabel.Caption = 'Telefone Residencial'
        end
        object DBLblEdtTLCELULAR: TDBLabeledEdit
          Left = 8
          Top = 88
          Width = 136
          Height = 23
          DataField = 'TLCELULAR'
          DataSource = DsFuncionario
          TabOrder = 2
          EditLabel.Width = 84
          EditLabel.Height = 15
          EditLabel.Caption = 'Telefone Celular'
        end
      end
      object GrpEndereco: TGroupBox
        Left = 3
        Top = 145
        Width = 427
        Height = 187
        Caption = 'Endere'#231'o'
        TabOrder = 1
        object Label3: TLabel
          Left = 8
          Top = 57
          Width = 39
          Height = 15
          Caption = 'C'#243'digo'
        end
        object Label4: TLabel
          Left = 79
          Top = 57
          Width = 37
          Height = 15
          Caption = 'Cidade'
        end
        object Label5: TLabel
          Left = 79
          Top = 17
          Width = 14
          Height = 15
          Caption = 'UF'
        end
        object Label6: TLabel
          Left = 8
          Top = 17
          Width = 39
          Height = 15
          Caption = 'C'#243'digo'
        end
        object DBLkpCbbUF: TDBLookupComboBox
          Left = 79
          Top = 32
          Width = 345
          Height = 23
          DataField = 'IDUF'
          DataSource = DsFuncionario
          KeyField = 'IDUF'
          ListField = 'NMESTADO'
          ListSource = DsEstado
          TabOrder = 1
        end
        object DBLkpCbbCidade: TDBLookupComboBox
          Left = 79
          Top = 72
          Width = 345
          Height = 23
          DataField = 'IDCIDADE'
          DataSource = DsFuncionario
          Enabled = False
          KeyField = 'IDCIDADE'
          ListField = 'NMCIDADE'
          ListSource = DsCidade
          TabOrder = 3
        end
        object EdtCodCidade: TButtonedEdit
          Left = 8
          Top = 72
          Width = 65
          Height = 23
          Images = ImgsBotoes
          NumbersOnly = True
          ParentShowHint = False
          RightButton.Hint = 'Pesquisar'
          RightButton.ImageIndex = 2
          RightButton.Visible = True
          ShowHint = True
          TabOrder = 2
          OnKeyDown = EdtCodCidadeKeyDown
          OnRightButtonClick = EdtCodCidadeRightButtonClick
        end
        object EdtCodUF: TButtonedEdit
          Left = 8
          Top = 32
          Width = 65
          Height = 23
          Images = ImgsBotoes
          NumbersOnly = True
          ParentShowHint = False
          RightButton.Hint = 'Pesquisar'
          RightButton.ImageIndex = 2
          RightButton.Visible = True
          ShowHint = True
          TabOrder = 0
          OnKeyDown = EdtCodUFKeyDown
          OnRightButtonClick = EdtCodUFRightButtonClick
        end
        object DBLblEdtNMENDERECO: TDBLabeledEdit
          Left = 8
          Top = 113
          Width = 416
          Height = 23
          DataField = 'NMENDERECO'
          DataSource = DsFuncionario
          TabOrder = 4
          EditLabel.Width = 62
          EditLabel.Height = 15
          EditLabel.Caption = 'Logradouro'
        end
        object DBLblEdtNUENDERECO: TDBLabeledEdit
          Left = 8
          Top = 156
          Width = 94
          Height = 23
          DataField = 'NUENDERECO'
          DataSource = DsFuncionario
          TabOrder = 5
          EditLabel.Width = 44
          EditLabel.Height = 15
          EditLabel.Caption = 'N'#250'mero'
        end
        object DBLblEdtNMBAIRRO: TDBLabeledEdit
          Left = 108
          Top = 156
          Width = 216
          Height = 23
          DataField = 'NMBAIRRO'
          DataSource = DsFuncionario
          TabOrder = 6
          EditLabel.Width = 31
          EditLabel.Height = 15
          EditLabel.Caption = 'Bairro'
        end
        object DBLblEdtNUCEP: TDBLabeledEdit
          Left = 330
          Top = 156
          Width = 92
          Height = 23
          DataField = 'NUCEP'
          DataSource = DsFuncionario
          TabOrder = 7
          EditLabel.Width = 21
          EditLabel.Height = 15
          EditLabel.Caption = 'CEP'
        end
      end
    end
    object GrpDadosAdicionais: TGroupBox
      Left = 447
      Top = 6
      Width = 444
      Height = 260
      Caption = 'Dados Adicionais'
      TabOrder = 1
      object GrpDocumentosPrincipais: TGroupBox
        Left = 3
        Top = 19
        Width = 206
        Height = 116
        Caption = 'Documentos Principais'
        TabOrder = 0
        object DBLblEdtNURG: TDBLabeledEdit
          Left = 8
          Top = 40
          Width = 94
          Height = 23
          DataField = 'NURG'
          DataSource = DsFuncionario
          TabOrder = 0
          EditLabel.Width = 20
          EditLabel.Height = 15
          EditLabel.Caption = 'RG*'
        end
        object DBLblEdtNUCPF: TDBLabeledEdit
          Left = 108
          Top = 40
          Width = 94
          Height = 23
          DataField = 'NUCPF'
          DataSource = DsFuncionario
          TabOrder = 1
          EditLabel.Width = 26
          EditLabel.Height = 15
          EditLabel.Caption = 'CPF*'
        end
        object DBLblEdtNUTITULOELEITOR: TDBLabeledEdit
          Left = 9
          Top = 88
          Width = 194
          Height = 23
          DataField = 'NUTITULOELEITOR'
          DataSource = DsFuncionario
          TabOrder = 2
          EditLabel.Width = 82
          EditLabel.Height = 15
          EditLabel.Caption = 'T'#237'tulo de Eleitor'
        end
      end
      object GrpCNH: TGroupBox
        Left = 3
        Top = 141
        Width = 206
        Height = 116
        Caption = 'CNH'
        TabOrder = 2
        object DBLblEdtNUCARTEIRAMOTORISTA: TDBLabeledEdit
          Left = 8
          Top = 40
          Width = 195
          Height = 23
          DataField = 'NUCARTEIRAMOTORISTA'
          DataSource = DsFuncionario
          TabOrder = 0
          EditLabel.Width = 73
          EditLabel.Height = 15
          EditLabel.Caption = 'N'#250'mero CNH'
        end
        object DBLblEdtDTVALIDADECARTEIRAMOT: TDBLabeledEdit
          Left = 8
          Top = 88
          Width = 94
          Height = 23
          DataField = 'DTVALIDADECARTEIRAMOT'
          DataSource = DsFuncionario
          TabOrder = 1
          EditLabel.Width = 87
          EditLabel.Height = 15
          EditLabel.Caption = 'Data de Validade'
        end
        object DBLblEdtTPCATEORIA: TDBLabeledEdit
          Left = 108
          Top = 88
          Width = 94
          Height = 23
          DataField = 'TPCATERORIA'
          DataSource = DsFuncionario
          TabOrder = 2
          EditLabel.Width = 51
          EditLabel.Height = 15
          EditLabel.Caption = 'Categoria'
        end
      end
      object GrpTrabalhista: TGroupBox
        Left = 215
        Top = 19
        Width = 229
        Height = 116
        Caption = 'Trabalhista'
        TabOrder = 1
        object DBLblEdtNUCARTEIRATRAB: TDBLabeledEdit
          Left = 8
          Top = 40
          Width = 218
          Height = 23
          DataField = 'NUCARTEIRATRAB'
          DataSource = DsFuncionario
          TabOrder = 0
          EditLabel.Width = 110
          EditLabel.Height = 15
          EditLabel.Caption = 'Carteira de Trabalho*'
        end
        object DBLblEdtDTDEMISSAO: TDBLabeledEdit
          Left = 8
          Top = 88
          Width = 106
          Height = 23
          DataField = 'DTDEMISSAO'
          DataSource = DsFuncionario
          TabOrder = 1
          EditLabel.Width = 94
          EditLabel.Height = 15
          EditLabel.Caption = 'Data de Demiss'#227'o'
        end
        object DBLblEdtDTCONTRATACAO: TDBLabeledEdit
          Left = 120
          Top = 88
          Width = 106
          Height = 23
          DataField = 'DTCONTRATACAO'
          DataSource = DsFuncionario
          TabOrder = 2
          EditLabel.Width = 97
          EditLabel.Height = 15
          EditLabel.Caption = 'Data Contrata'#231#227'o*'
        end
      end
      object GrpContatoAdicional: TGroupBox
        Left = 215
        Top = 141
        Width = 226
        Height = 116
        Caption = 'Contato Adicional'
        TabOrder = 3
        object DBLblEdtNMCONTATO: TDBLabeledEdit
          Left = 8
          Top = 40
          Width = 215
          Height = 23
          DataField = 'NMCONTATO'
          DataSource = DsFuncionario
          TabOrder = 0
          EditLabel.Width = 96
          EditLabel.Height = 15
          EditLabel.Caption = 'Nome do Contato'
        end
        object DBLblEdtTLCONTATO: TDBLabeledEdit
          Left = 8
          Top = 88
          Width = 109
          Height = 23
          DataField = 'TLCONTATO'
          DataSource = DsFuncionario
          TabOrder = 1
          EditLabel.Width = 107
          EditLabel.Height = 15
          EditLabel.Caption = 'Telefone do Contato'
        end
      end
    end
    object GroupBox1: TGroupBox
      Left = 447
      Top = 269
      Width = 444
      Height = 193
      Caption = 'Observa'#231#245'es'
      TabOrder = 3
      object DBMemoTXOBS: TDBMemo
        Left = 2
        Top = 17
        Width = 440
        Height = 174
        Align = alClient
        DataField = 'TXOBS'
        DataSource = DsFuncionario
        TabOrder = 0
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 517
    Width = 898
    Height = 41
    Align = alBottom
    TabOrder = 2
    object SpdBtnCancelar: TSpeedButton
      Left = 125
      Top = 6
      Width = 113
      Height = 33
      Caption = 'Cancelar'
      ImageIndex = 0
      Images = ImgsBotoes
      OnClick = SpdBtnCancelarClick
    end
    object SpdBtnSalvar: TSpeedButton
      Left = 6
      Top = 6
      Width = 113
      Height = 33
      Caption = 'Salvar'
      ImageIndex = 1
      Images = ImgsBotoes
      OnClick = SpdBtnSalvarClick
    end
  end
  object ImgsBotoes: TImageList
    Left = 208
    Top = 7
    Bitmap = {
      494C010103000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001420C4FF1420C4FF020284FF020284FFF6FFEBFF0000
      000000000000000000000000000000000000CE5E00FFCE5E00FFCE5E00FFFFDB
      BDFFFFDBBDFFFFDBBDFFFFDBBDFFFFDBBDFFFFC99BFFFFC99BFFFFC99BFFFFC9
      9BFFFFC99BFF8A3F00FF8A3F00FF8A3F00FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E0EA
      D6FF1420C4FF1420C4FF1420C4FF1420C4FF020284FF020284FF020284FF0202
      84FFF6FFEBFF000000000000000000000000CE5E00FFCE5E00FFCE5E00FFFFDB
      BDFFFFDBBDFFFFDBBDFFFFDBBDFFFFDBBDFFFFC99BFFFFC99BFFFFC99BFFFFC9
      9BFFFFC99BFF8A3F00FF8A3F00FF8A3F00FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E0EAD6FF1420
      C4FF1420C4FF1420C4FF1420C4FF1420C4FF020284FF020284FF020284FF0202
      84FF020284FFF6FFEBFF0000000000000000CE5E00FFCE5E00FFCE5E00FFFFDB
      BDFFFFDBBDFFFFDBBDFFFFDBBDFFFFDBBDFFFFC99BFFFFC99BFFFFC99BFFFFC9
      9BFFFFC99BFF8A3F00FF8A3F00FF8A3F00FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E0EAD6FF1420C4FF1420
      C4FF1420C4FF1420C4FF1420C4FF1420C4FF020284FF020284FF020284FF0202
      84FF020284FF020284FFF6FFEBFF00000000CE5E00FFCE5E00FFCE5E00FFFFDB
      BDFFFFDBBDFFFFDBBDFFFFDBBDFFFFDBBDFFFFC99BFFFFC99BFFFFC99BFFFFC9
      9BFFFFC99BFF8A3F00FF8A3F00FF8A3F00FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001420C4FF1420C4FF1420
      C4FF1420C4FF1420C4FF1420C4FFE0EAD6FFE0EAD6FF020284FF020284FF0202
      84FF020284FF020284FF020284FF00000000CE5E00FFCE5E00FFCE5E00FFFFDB
      BDFFFFDBBDFFFFDBBDFFFFDBBDFFFFDBBDFFFFC99BFFFFC99BFFFFC99BFFFFC9
      9BFFFFC99BFF8A3F00FF8A3F00FF8A3F00FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000001B1B1B00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E0EAD6FF1420C4FF1420C4FF1420
      C4FF1420C4FFE0EAD6FFE0EAD6FFE0EAD6FF020284FF020284FF020284FF0202
      84FF020284FF020284FF020284FFF6FFEBFFCE5E00FFCE5E00FFCE5E00FFFFDB
      BDFFFFDBBDFFFFDBBDFFFFDBBDFFFFDBBDFFFFC99BFFFFC99BFFFFC99BFFFFC9
      9BFFFFC99BFF8A3F00FF8A3F00FF8A3F00FFFFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001420C4FF1420C4FF1420C4FF1420
      C4FFC1CBD3FFE0EAD6FFE0EAD6FF1420C4FF020284FF020284FF020284FF0202
      84FF020284FF020284FF020284FFE0EAD6FFCE5E00FFCE5E00FFCE5E00FFFFDB
      BDFFFFDBBDFFFFDBBDFFFFDBBDFFFFDBBDFFFFC99BFFFFC99BFFFFC99BFFFFC9
      9BFFFFC99BFF8A3F00FF8A3F00FF8A3F00FFFFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001420C4FF1420C4FF1420C4FF1420
      C4FFE0EAD6FFE0EAD6FF1420C4FF1420C4FF020284FF020284FFE0EAD6FFE0EA
      D6FF020284FF020284FF020284FF020284FFCE5E00FFCE5E00FFCE5E00FFFFDB
      BDFFFFDBBDFFFFDBBDFFFFDBBDFFFFDBBDFFFFC99BFFFFC99BFFFFC99BFFFFC9
      9BFFFFC99BFF8A3F00FF8A3F00FF8A3F00FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001420C4FF1420C4FF1420C4FF1420
      C4FFF6FFEBFF1420C4FF1420C4FF1420C4FF020284FFF6FFEBFFF6FFEBFFF6FF
      EBFF020284FF020284FF020284FF020284FFCE5E00FFCE5E00FFCE5E00FFCE5E
      00FFCE5E00FFCE5E00FFCE5E00FFCE5E00FF8A3F00FF8A3F00FF8A3F00FF8A3F
      00FF8A3F00FF8A3F00FF8A3F00FF8A3F00FFFFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001420C4FF1420C4FF1420C4FF1420
      C4FF1420C4FF1420C4FF1420C4FF1420C4FFF6FFEBFFF6FFEBFFF6FFEBFF0202
      84FF020284FF020284FF020284FFF6FFEBFFCE5E00FFCE5E00FFCE5E00FFCE5E
      00FFCE5E00FFCE5E00FFCE5E00FFCE5E00FF8A3F00FF8A3F00FF8A3F00FF8A3F
      00FF8A3F00FF8A3F00FF8A3F00FF8A3F00FFFFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8D8
      D800FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001420C4FF1420C4FF1420
      C4FF1420C4FF1420C4FF1420C4FFF6FFEBFFF6FFEBFFF6FFEBFFF6FFEBFF0202
      84FF020284FF020284FF020284FFF6FFEBFFCE5E00FFCE5E00FFCE5E00FFCE5E
      00FFCE5E00FFCE5E00FFCE5E00FFCE5E00FF8A3F00FF8A3F00FF8A3F00FF8A3F
      00FF8A3F00FF8A3F00FF8A3F00FF8A3F00FFFFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001420C4FF1420C4FF1420
      C4FF1420C4FF1420C4FF1420C4FFF6FFEBFFF6FFEBFF020284FF020284FF0202
      84FF020284FF020284FF020284FF00000000CE5E00FFCE5E00FFCE5E00FFCE5E
      00FFCE5E00FFCE5E00FFCE5E00FFCE5E00FF8A3F00FF8A3F00FF8A3F00FF8A3F
      00FF8A3F00FF8A3F00FF8A3F00FF8A3F00FFFFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001420C4FF1420
      C4FF1420C4FF1420C4FF1420C4FF1420C4FF020284FF020284FF020284FF0202
      84FF020284FF020284FFF6FFEBFF00000000CE5E00FFCE5E00FFCE5E00FFFFDB
      BDFFFFDBBDFFFFDBBDFFFFDBBDFFFFDBBDFFFFC99BFFFFC99BFFFFC99BFFFFC9
      9BFFFFC99BFF8A3F00FF8A3F00FF8A3F00FFFFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7F700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F4FFE92F1420
      C4FF1420C4FF1420C4FF1420C4FF1420C4FF020284FF020284FF020284FF0202
      84FF020284FFF6FFEBFF0000000000000000CE5E00FFCE5E00FFCE5E00FFFFDB
      BDFFFFDBBDFFFFDBBDFFFFDBBDFFFFDBBDFFFFC99BFFFFC99BFFFFC99BFFFFC9
      9BFFFFC99BFF8A3F00FF8A3F00FF00000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4E4E4003C3C3C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001420C4FF1420C4FF1420C4FF1420C4FF020284FF020284FF020284FF0202
      84FFF6FFEBFF000000000000000000000000CE5E00FFCE5E00FFCE5E00FFFFDB
      BDFFFFDBBDFFFFDBBDFFFFDBBDFFFFDBBDFFFFC99BFFFFC99BFFFFC99BFFFFC9
      9BFFFFC99BFF8A3F00FF0000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001420C4FF1420C4FF020284FF020284FFF6FFEBFF0000
      000000000000000000000000000000000000CE5E00FFCE5E00FFCE5E00FFFFDB
      BDFFFFDBBDFFFFDBBDFFFFDBBDFFFFDBBDFFFFC99BFFFFC99BFFFFC99BFFFFC9
      9BFFFFC99BFF000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FC1F000000000000E007000000000000
      C003000000000000800100000000000080010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      80000000000000008001000000000000C001000000000000C003000000000000
      F007000000000000FC1F00000000000000000000000000000000000000000000
      000000000000}
  end
  object QryFuncionario: TFDQuery
    Connection = frmPrincipal.ConnPrincipal
    SQL.Strings = (
      'SELECT * FROM CADFUNCIONARIOS c'
      'WHERE IDFUNCIONARIO = :COD_FUNCIONARIO')
    Left = 400
    Top = 48
    ParamData = <
      item
        Name = 'COD_FUNCIONARIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object QryFuncionarioIDFUNCIONARIO: TIntegerField
      FieldName = 'IDFUNCIONARIO'
      Origin = 'IDFUNCIONARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryFuncionarioIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
      Origin = 'IDEMPRESA'
    end
    object QryFuncionarioNMFUNCIONARIO: TStringField
      FieldName = 'NMFUNCIONARIO'
      Origin = 'NMFUNCIONARIO'
      Required = True
      Size = 100
    end
    object QryFuncionarioNUCPF: TStringField
      FieldName = 'NUCPF'
      Origin = 'NUCPF'
      Required = True
      EditMask = '000.000.000-00;1; '
      Size = 18
    end
    object QryFuncionarioNURG: TStringField
      FieldName = 'NURG'
      Origin = 'NURG'
      Required = True
      EditMask = '00.000.000-09;1; '
      Size = 15
    end
    object QryFuncionarioDTNASCIMENTO: TDateField
      FieldName = 'DTNASCIMENTO'
      Origin = 'DTNASCIMENTO'
      EditMask = '!99/99/0000;1;_'
    end
    object QryFuncionarioTXEMAIL: TStringField
      FieldName = 'TXEMAIL'
      Origin = 'TXEMAIL'
      Size = 100
    end
    object QryFuncionarioNUCARTEIRATRAB: TStringField
      FieldName = 'NUCARTEIRATRAB'
      Origin = 'NUCARTEIRATRAB'
      Required = True
    end
    object QryFuncionarioNUTITULOELEITOR: TStringField
      FieldName = 'NUTITULOELEITOR'
      Origin = 'NUTITULOELEITOR'
      Size = 12
    end
    object QryFuncionarioNUCARTEIRAMOTORISTA: TStringField
      FieldName = 'NUCARTEIRAMOTORISTA'
      Origin = 'NUCARTEIRAMOTORISTA'
      Size = 15
    end
    object QryFuncionarioTPCATERORIA: TStringField
      FieldName = 'TPCATERORIA'
      Origin = 'TPCATERORIA'
      Size = 4
    end
    object QryFuncionarioDTVALIDADECARTEIRAMOT: TDateField
      FieldName = 'DTVALIDADECARTEIRAMOT'
      Origin = 'DTVALIDADECARTEIRAMOT'
      EditMask = '!99/99/0000;1;_'
    end
    object QryFuncionarioTLRESIDENCIAL: TStringField
      FieldName = 'TLRESIDENCIAL'
      Origin = 'TLRESIDENCIAL'
      EditMask = '!\(99\) 0000-0000;1;_'
      Size = 15
    end
    object QryFuncionarioTLCELULAR: TStringField
      FieldName = 'TLCELULAR'
      Origin = 'TLCELULAR'
      EditMask = '!\(99\) 90000-0000;1;_'
      Size = 15
    end
    object QryFuncionarioTLCONTATO: TStringField
      FieldName = 'TLCONTATO'
      Origin = 'TLCONTATO'
      EditMask = '!\(99\) 90000-0000;1;_'
      Size = 15
    end
    object QryFuncionarioNMCONTATO: TStringField
      FieldName = 'NMCONTATO'
      Origin = 'NMCONTATO'
      Size = 50
    end
    object QryFuncionarioDTCONTRATACAO: TDateField
      FieldName = 'DTCONTRATACAO'
      Origin = 'DTCONTRATACAO'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object QryFuncionarioDTDEMISSAO: TDateField
      FieldName = 'DTDEMISSAO'
      Origin = 'DTDEMISSAO'
      EditMask = '!99/99/0000;1;_'
    end
    object QryFuncionarioDTCADASTRO: TDateField
      FieldName = 'DTCADASTRO'
      Origin = 'DTCADASTRO'
      EditMask = '!99/99/0000;1;_'
    end
    object QryFuncionarioSTATIVO: TStringField
      FieldName = 'STATIVO'
      Origin = 'STATIVO'
      FixedChar = True
      Size = 1
    end
    object QryFuncionarioTXOBS: TStringField
      FieldName = 'TXOBS'
      Origin = 'TXOBS'
      Size = 1000
    end
    object QryFuncionarioNMENDERECO: TStringField
      FieldName = 'NMENDERECO'
      Origin = 'NMENDERECO'
      Size = 100
    end
    object QryFuncionarioNUENDERECO: TStringField
      FieldName = 'NUENDERECO'
      Origin = 'NUENDERECO'
      Size = 10
    end
    object QryFuncionarioNMBAIRRO: TStringField
      FieldName = 'NMBAIRRO'
      Origin = 'NMBAIRRO'
      Size = 100
    end
    object QryFuncionarioIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
      Origin = 'IDCIDADE'
      OnChange = QryFuncionarioIDCIDADEChange
    end
    object QryFuncionarioIDUF: TIntegerField
      FieldName = 'IDUF'
      Origin = 'IDUF'
      OnChange = QryFuncionarioIDUFChange
    end
    object QryFuncionarioNUCEP: TStringField
      FieldName = 'NUCEP'
      Origin = 'NUCEP'
      EditMask = '00000-000;1;_'
      Size = 10
    end
    object QryFuncionarioSTEXCLUIDO: TStringField
      FieldName = 'STEXCLUIDO'
      Origin = 'STEXCLUIDO'
      FixedChar = True
      Size = 1
    end
    object QryFuncionarioDTEXCLUIDO: TDateField
      FieldName = 'DTEXCLUIDO'
      Origin = 'DTEXCLUIDO'
    end
  end
  object DsFuncionario: TDataSource
    DataSet = QryFuncionario
    Left = 376
  end
  object QryEmpresa: TFDQuery
    Connection = frmPrincipal.ConnPrincipal
    SQL.Strings = (
      'SELECT NMEMPRESA FROM CADEMPRESA c'
      'WHERE IDEMPRESA = :COD_EMPRESA')
    Left = 280
    Top = 48
    ParamData = <
      item
        Name = 'COD_EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object QryEmpresaNMEMPRESA: TStringField
      FieldName = 'NMEMPRESA'
      Origin = 'NMEMPRESA'
      Size = 100
    end
  end
  object DsEmpresa: TDataSource
    DataSet = QryEmpresa
    Left = 272
    Top = 8
  end
  object QryCidade: TFDQuery
    Connection = frmPrincipal.ConnPrincipal
    SQL.Strings = (
      'SELECT * FROM CADCIDADE c'
      
        'WHERE (c.IDCIDADE = :COD_CIDADE OR :COD_CIDADE = 0) AND (c.IDUF ' +
        '= :COD_UF OR :COD_UF = 0)')
    Left = 144
    Top = 48
    ParamData = <
      item
        Name = 'COD_CIDADE'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'COD_UF'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
    object QryCidadeIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
      Origin = 'IDCIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryCidadeNMCIDADE: TStringField
      FieldName = 'NMCIDADE'
      Origin = 'NMCIDADE'
      Size = 100
    end
    object QryCidadeIDUF: TIntegerField
      FieldName = 'IDUF'
      Origin = 'IDUF'
      Required = True
    end
    object QryCidadeNOIBGE: TStringField
      FieldName = 'NOIBGE'
      Origin = 'NOIBGE'
      Size = 7
    end
  end
  object DsCidade: TDataSource
    DataSet = QryCidade
    Left = 144
  end
  object QryEstado: TFDQuery
    Connection = frmPrincipal.ConnPrincipal
    SQL.Strings = (
      'SELECT * FROM CADUF c'
      'WHERE c.IDUF = :COD_UF OR :COD_UF = 0')
    Left = 320
    Top = 48
    ParamData = <
      item
        Name = 'COD_UF'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
    object QryEstadoIDUF: TIntegerField
      FieldName = 'IDUF'
      Origin = 'IDUF'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryEstadoNMESTADO: TStringField
      FieldName = 'NMESTADO'
      Origin = 'NMESTADO'
      Size = 50
    end
    object QryEstadoSGESTADO: TStringField
      FieldName = 'SGESTADO'
      Origin = 'SGESTADO'
      FixedChar = True
      Size = 3
    end
  end
  object DsEstado: TDataSource
    DataSet = QryEstado
    Left = 320
  end
end
