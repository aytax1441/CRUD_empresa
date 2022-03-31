object frmCadTitulares: TfrmCadTitulares
  Left = 0
  Top = 0
  Caption = 'Cadastro de Titulares'
  ClientHeight = 459
  ClientWidth = 685
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object PnlCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 685
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 5
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
    object DBTxIDTITULAR: TDBText
      Left = 80
      Top = 9
      Width = 134
      Height = 20
      DataField = 'IDTITULAR'
      DataSource = DsTitular
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 241
      Top = 0
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
    object DBTxNMEMPRESA: TDBText
      Left = 241
      Top = 15
      Width = 416
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
  end
  object PnlCorpo: TPanel
    Left = 0
    Top = 41
    Width = 685
    Height = 373
    Align = alClient
    TabOrder = 1
    object GrpDadosPrincipais: TGroupBox
      Left = 6
      Top = 6
      Width = 483
      Height = 171
      Caption = 'Dados Principais'
      TabOrder = 0
      object DBLblEdtNMTITULAR: TDBLabeledEdit
        Left = 3
        Top = 42
        Width = 310
        Height = 23
        DataField = 'NMTITULAR'
        DataSource = DsTitular
        TabOrder = 0
        EditLabel.Width = 38
        EditLabel.Height = 15
        EditLabel.Caption = 'Nome*'
      end
      object DBLblEdtNUCNPJCPF: TDBLabeledEdit
        Left = 187
        Top = 87
        Width = 126
        Height = 23
        DataField = 'NUCNPJCPF'
        DataSource = DsTitular
        TabOrder = 2
        EditLabel.Width = 32
        EditLabel.Height = 15
        EditLabel.Caption = 'CNPJ*'
      end
      object RdGrpNatureza: TRadioGroup
        Left = 3
        Top = 71
        Width = 178
        Height = 82
        Caption = 'Natureza'
        ItemIndex = 0
        Items.Strings = (
          'Pessoa Jur'#237'dica'
          'Pessoa F'#237'sica')
        TabOrder = 1
        OnClick = RdGrpNaturezaClick
      end
      object DBLblEdtNUINCRICAORG: TDBLabeledEdit
        Left = 187
        Top = 128
        Width = 126
        Height = 23
        DataField = 'NUINCRICAORG'
        DataSource = DsTitular
        TabOrder = 3
        EditLabel.Width = 99
        EditLabel.Height = 15
        EditLabel.Caption = 'Inscri'#231#227'o Estadual*'
      end
      object DBLblEdtDtCadastro: TDBLabeledEdit
        Left = 328
        Top = 87
        Width = 145
        Height = 23
        DataField = 'DTCADASTRO'
        DataSource = DsTitular
        ReadOnly = True
        TabOrder = 5
        EditLabel.Width = 90
        EditLabel.Height = 15
        EditLabel.Caption = 'Data de Cadastro'
      end
      object DBLblEdtDtNascimento: TDBLabeledEdit
        Left = 328
        Top = 127
        Width = 143
        Height = 23
        DataField = 'DTNASCIMENTO'
        DataSource = DsTitular
        TabOrder = 4
        EditLabel.Width = 112
        EditLabel.Height = 15
        EditLabel.Caption = 'Data de Nascimento*'
      end
      object DBChkAtivo: TDBCheckBox
        Left = 374
        Top = 22
        Width = 97
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Titular Ativo?'
        DataField = 'STATIVO'
        DataSource = DsTitular
        TabOrder = 6
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    object GrpDadosContato: TGroupBox
      Left = 6
      Top = 183
      Width = 483
      Height = 184
      Caption = 'Dados de Contato'
      TabOrder = 1
      object DBLblEdtTLRESIDENCIAL: TDBLabeledEdit
        Left = 3
        Top = 39
        Width = 112
        Height = 23
        DataField = 'TLRESIDENCIAL'
        DataSource = DsTitular
        TabOrder = 0
        EditLabel.Width = 106
        EditLabel.Height = 15
        EditLabel.Caption = 'Telefone Residencial'
      end
      object DBLblEdtTLCELULAR: TDBLabeledEdit
        Left = 121
        Top = 39
        Width = 113
        Height = 23
        DataField = 'TLCELULAR'
        DataSource = DsTitular
        TabOrder = 1
        EditLabel.Width = 84
        EditLabel.Height = 15
        EditLabel.Caption = 'Telefone Celular'
      end
      object GrpDadosContatoAdicional: TGroupBox
        Left = 3
        Top = 68
        Width = 477
        Height = 113
        Caption = 'Contato Adicional'
        TabOrder = 3
        object DBLblEdtNMCONTATO: TDBLabeledEdit
          Left = 3
          Top = 37
          Width = 465
          Height = 23
          DataField = 'NMCONTATO'
          DataSource = DsTitular
          TabOrder = 0
          EditLabel.Width = 96
          EditLabel.Height = 15
          EditLabel.Caption = 'Nome do Contato'
        end
        object DBLblEdtTLCONTATO: TDBLabeledEdit
          Left = 3
          Top = 81
          Width = 109
          Height = 23
          DataField = 'TLCONTATO'
          DataSource = DsTitular
          TabOrder = 1
          EditLabel.Width = 107
          EditLabel.Height = 15
          EditLabel.Caption = 'Telefone do Contato'
        end
      end
      object DBLblEdtTXEMAIL: TDBLabeledEdit
        Left = 240
        Top = 39
        Width = 231
        Height = 23
        DataField = 'TXEMAIL'
        DataSource = DsTitular
        TabOrder = 2
        EditLabel.Width = 34
        EditLabel.Height = 15
        EditLabel.Caption = 'E-mail'
      end
    end
    object GrpObservacao: TGroupBox
      Left = 495
      Top = 6
      Width = 184
      Height = 361
      Caption = 'Observa'#231#245'es'
      TabOrder = 2
      object DBMemoTXOBS: TDBMemo
        AlignWithMargins = True
        Left = 7
        Top = 22
        Width = 170
        Height = 332
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        DataField = 'TXOBS'
        DataSource = DsTitular
        TabOrder = 0
      end
    end
  end
  object PnlRodape: TPanel
    Left = 0
    Top = 414
    Width = 685
    Height = 45
    Align = alBottom
    TabOrder = 2
    object SpdBtnCancelar: TSpeedButton
      Left = 127
      Top = 6
      Width = 113
      Height = 33
      Caption = 'Cancelar'
      ImageIndex = 0
      Images = ImgsBotoes
      OnClick = SpdBtnCancelarClick
    end
    object SpdBtnSalvar: TSpeedButton
      Left = 8
      Top = 6
      Width = 113
      Height = 33
      Caption = 'Salvar'
      ImageIndex = 1
      Images = ImgsBotoes
      OnClick = SpdBtnSalvarClick
    end
  end
  object QryTitular: TFDQuery
    Connection = frmPrincipal.ConnPrincipal
    SQL.Strings = (
      'SELECT '#9'c.IDTITULAR,'
      #9#9'c.IDEMPRESA,'
      #9#9'c.NMTITULAR,'
      #9#9'c.NUCNPJCPF,'
      #9#9'c.NUINCRICAORG,'
      #9#9'c.DTNASCIMENTO,'
      #9#9'c.DTCADASTRO,'
      #9#9'c.TXEMAIL,'
      #9#9'c.TXOBS,'
      #9#9'c.TLRESIDENCIAL,'
      #9#9'c.TLCELULAR,'
      #9#9'c.TLCONTATO,'
      #9#9'c.NMCONTATO,'
      #9#9'c.STATIVO,'
      #9#9'c.STEXCLUIDO'
      #9'FROM CADTITULAR c'
      'WHERE c.IDTITULAR = :COD_TITULAR')
    Left = 608
    Top = 161
    ParamData = <
      item
        Name = 'COD_TITULAR'
        DataType = ftInteger
        ParamType = ptInput
        Value = 4
      end>
    object QryTitularIDTITULAR: TIntegerField
      FieldName = 'IDTITULAR'
      Origin = 'IDTITULAR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryTitularNMTITULAR: TStringField
      FieldName = 'NMTITULAR'
      Origin = 'NMTITULAR'
      Required = True
      Size = 100
    end
    object QryTitularNUCNPJCPF: TStringField
      FieldName = 'NUCNPJCPF'
      Origin = 'NUCNPJCPF'
      Required = True
      EditMask = '00.000.000/0000-00;1; '
      Size = 18
    end
    object QryTitularNUINCRICAORG: TStringField
      FieldName = 'NUINCRICAORG'
      Origin = 'NUINCRICAORG'
      EditMask = '000.000.000.000;1;_'
      Size = 15
    end
    object QryTitularDTNASCIMENTO: TDateField
      FieldName = 'DTNASCIMENTO'
      Origin = 'DTNASCIMENTO'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object QryTitularDTCADASTRO: TDateField
      FieldName = 'DTCADASTRO'
      Origin = 'DTCADASTRO'
      EditMask = '!99/99/0000;1;_'
    end
    object QryTitularTXEMAIL: TStringField
      FieldName = 'TXEMAIL'
      Origin = 'TXEMAIL'
      Size = 100
    end
    object QryTitularTXOBS: TStringField
      FieldName = 'TXOBS'
      Origin = 'TXOBS'
      Size = 1000
    end
    object QryTitularTLRESIDENCIAL: TStringField
      FieldName = 'TLRESIDENCIAL'
      Origin = 'TLRESIDENCIAL'
      EditMask = '!\(99\)0000-0000;1; '
      Size = 15
    end
    object QryTitularTLCELULAR: TStringField
      FieldName = 'TLCELULAR'
      Origin = 'TLCELULAR'
      EditMask = '!\(99\) 90000-0000;1; '
      Size = 15
    end
    object QryTitularTLCONTATO: TStringField
      FieldName = 'TLCONTATO'
      Origin = 'TLCONTATO'
      EditMask = '!\(99\) 900000000;1;_'
      Size = 15
    end
    object QryTitularNMCONTATO: TStringField
      FieldName = 'NMCONTATO'
      Origin = 'NMCONTATO'
      Size = 50
    end
    object QryTitularSTATIVO: TStringField
      FieldName = 'STATIVO'
      Origin = 'STATIVO'
      FixedChar = True
      Size = 1
    end
    object QryTitularSTEXCLUIDO: TStringField
      FieldName = 'STEXCLUIDO'
      Origin = 'STEXCLUIDO'
      FixedChar = True
      Size = 1
    end
    object QryTitularIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
      Origin = 'IDEMPRESA'
      Required = True
    end
  end
  object DsTitular: TDataSource
    DataSet = QryTitular
    Left = 608
    Top = 105
  end
  object ImgsBotoes: TImageList
    Left = 542
    Top = 272
    Bitmap = {
      494C010102000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001420C4FF1420C4FF020284FF020284FFF6FFEBFF0000
      000000000000000000000000000000000000CE5E00FFCE5E00FFCE5E00FFFFDB
      BDFFFFDBBDFFFFDBBDFFFFDBBDFFFFDBBDFFFFC99BFFFFC99BFFFFC99BFFFFC9
      9BFFFFC99BFF8A3F00FF8A3F00FF8A3F00FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E0EA
      D6FF1420C4FF1420C4FF1420C4FF1420C4FF020284FF020284FF020284FF0202
      84FFF6FFEBFF000000000000000000000000CE5E00FFCE5E00FFCE5E00FFFFDB
      BDFFFFDBBDFFFFDBBDFFFFDBBDFFFFDBBDFFFFC99BFFFFC99BFFFFC99BFFFFC9
      9BFFFFC99BFF8A3F00FF8A3F00FF8A3F00FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E0EAD6FF1420
      C4FF1420C4FF1420C4FF1420C4FF1420C4FF020284FF020284FF020284FF0202
      84FF020284FFF6FFEBFF0000000000000000CE5E00FFCE5E00FFCE5E00FFFFDB
      BDFFFFDBBDFFFFDBBDFFFFDBBDFFFFDBBDFFFFC99BFFFFC99BFFFFC99BFFFFC9
      9BFFFFC99BFF8A3F00FF8A3F00FF8A3F00FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E0EAD6FF1420C4FF1420
      C4FF1420C4FF1420C4FF1420C4FF1420C4FF020284FF020284FF020284FF0202
      84FF020284FF020284FFF6FFEBFF00000000CE5E00FFCE5E00FFCE5E00FFFFDB
      BDFFFFDBBDFFFFDBBDFFFFDBBDFFFFDBBDFFFFC99BFFFFC99BFFFFC99BFFFFC9
      9BFFFFC99BFF8A3F00FF8A3F00FF8A3F00FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001420C4FF1420C4FF1420
      C4FF1420C4FF1420C4FF1420C4FFE0EAD6FFE0EAD6FF020284FF020284FF0202
      84FF020284FF020284FF020284FF00000000CE5E00FFCE5E00FFCE5E00FFFFDB
      BDFFFFDBBDFFFFDBBDFFFFDBBDFFFFDBBDFFFFC99BFFFFC99BFFFFC99BFFFFC9
      9BFFFFC99BFF8A3F00FF8A3F00FF8A3F00FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E0EAD6FF1420C4FF1420C4FF1420
      C4FF1420C4FFE0EAD6FFE0EAD6FFE0EAD6FF020284FF020284FF020284FF0202
      84FF020284FF020284FF020284FFF6FFEBFFCE5E00FFCE5E00FFCE5E00FFFFDB
      BDFFFFDBBDFFFFDBBDFFFFDBBDFFFFDBBDFFFFC99BFFFFC99BFFFFC99BFFFFC9
      9BFFFFC99BFF8A3F00FF8A3F00FF8A3F00FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001420C4FF1420C4FF1420C4FF1420
      C4FFC1CBD3FFE0EAD6FFE0EAD6FF1420C4FF020284FF020284FF020284FF0202
      84FF020284FF020284FF020284FFE0EAD6FFCE5E00FFCE5E00FFCE5E00FFFFDB
      BDFFFFDBBDFFFFDBBDFFFFDBBDFFFFDBBDFFFFC99BFFFFC99BFFFFC99BFFFFC9
      9BFFFFC99BFF8A3F00FF8A3F00FF8A3F00FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001420C4FF1420C4FF1420C4FF1420
      C4FFE0EAD6FFE0EAD6FF1420C4FF1420C4FF020284FF020284FFE0EAD6FFE0EA
      D6FF020284FF020284FF020284FF020284FFCE5E00FFCE5E00FFCE5E00FFFFDB
      BDFFFFDBBDFFFFDBBDFFFFDBBDFFFFDBBDFFFFC99BFFFFC99BFFFFC99BFFFFC9
      9BFFFFC99BFF8A3F00FF8A3F00FF8A3F00FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001420C4FF1420C4FF1420C4FF1420
      C4FFF6FFEBFF1420C4FF1420C4FF1420C4FF020284FFF6FFEBFFF6FFEBFFF6FF
      EBFF020284FF020284FF020284FF020284FFCE5E00FFCE5E00FFCE5E00FFCE5E
      00FFCE5E00FFCE5E00FFCE5E00FFCE5E00FF8A3F00FF8A3F00FF8A3F00FF8A3F
      00FF8A3F00FF8A3F00FF8A3F00FF8A3F00FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001420C4FF1420C4FF1420C4FF1420
      C4FF1420C4FF1420C4FF1420C4FF1420C4FFF6FFEBFFF6FFEBFFF6FFEBFF0202
      84FF020284FF020284FF020284FFF6FFEBFFCE5E00FFCE5E00FFCE5E00FFCE5E
      00FFCE5E00FFCE5E00FFCE5E00FFCE5E00FF8A3F00FF8A3F00FF8A3F00FF8A3F
      00FF8A3F00FF8A3F00FF8A3F00FF8A3F00FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001420C4FF1420C4FF1420
      C4FF1420C4FF1420C4FF1420C4FFF6FFEBFFF6FFEBFFF6FFEBFFF6FFEBFF0202
      84FF020284FF020284FF020284FFF6FFEBFFCE5E00FFCE5E00FFCE5E00FFCE5E
      00FFCE5E00FFCE5E00FFCE5E00FFCE5E00FF8A3F00FF8A3F00FF8A3F00FF8A3F
      00FF8A3F00FF8A3F00FF8A3F00FF8A3F00FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001420C4FF1420C4FF1420
      C4FF1420C4FF1420C4FF1420C4FFF6FFEBFFF6FFEBFF020284FF020284FF0202
      84FF020284FF020284FF020284FF00000000CE5E00FFCE5E00FFCE5E00FFCE5E
      00FFCE5E00FFCE5E00FFCE5E00FFCE5E00FF8A3F00FF8A3F00FF8A3F00FF8A3F
      00FF8A3F00FF8A3F00FF8A3F00FF8A3F00FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001420C4FF1420
      C4FF1420C4FF1420C4FF1420C4FF1420C4FF020284FF020284FF020284FF0202
      84FF020284FF020284FFF6FFEBFF00000000CE5E00FFCE5E00FFCE5E00FFFFDB
      BDFFFFDBBDFFFFDBBDFFFFDBBDFFFFDBBDFFFFC99BFFFFC99BFFFFC99BFFFFC9
      9BFFFFC99BFF8A3F00FF8A3F00FF8A3F00FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F4FFE92F1420
      C4FF1420C4FF1420C4FF1420C4FF1420C4FF020284FF020284FF020284FF0202
      84FF020284FFF6FFEBFF0000000000000000CE5E00FFCE5E00FFCE5E00FFFFDB
      BDFFFFDBBDFFFFDBBDFFFFDBBDFFFFDBBDFFFFC99BFFFFC99BFFFFC99BFFFFC9
      9BFFFFC99BFF8A3F00FF8A3F00FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001420C4FF1420C4FF1420C4FF1420C4FF020284FF020284FF020284FF0202
      84FFF6FFEBFF000000000000000000000000CE5E00FFCE5E00FFCE5E00FFFFDB
      BDFFFFDBBDFFFFDBBDFFFFDBBDFFFFDBBDFFFFC99BFFFFC99BFFFFC99BFFFFC9
      9BFFFFC99BFF8A3F00FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001420C4FF1420C4FF020284FF020284FFF6FFEBFF0000
      000000000000000000000000000000000000CE5E00FFCE5E00FFCE5E00FFFFDB
      BDFFFFDBBDFFFFDBBDFFFFDBBDFFFFDBBDFFFFC99BFFFFC99BFFFFC99BFFFFC9
      9BFFFFC99BFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
  object QryEmpresa: TFDQuery
    Connection = frmPrincipal.ConnPrincipal
    SQL.Strings = (
      'SELECT NMEMPRESA FROM CADEMPRESA WHERE IDEMPRESA = :COD_EMPRESA')
    Left = 615
    Top = 215
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
    Left = 615
    Top = 271
  end
end