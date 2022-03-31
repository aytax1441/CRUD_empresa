object frmPesquisa: TfrmPesquisa
  Left = 0
  Top = 0
  Caption = 'Pesquisa de <>'
  ClientHeight = 264
  ClientWidth = 620
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object PnlDados: TPanel
    Left = 0
    Top = 0
    Width = 620
    Height = 223
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 152
    ExplicitTop = 16
    ExplicitWidth = 185
    ExplicitHeight = 41
    object GridBusca: TDBGrid
      Left = 1
      Top = 1
      Width = 618
      Height = 221
      Align = alClient
      DataSource = DsBusca
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = GridBuscaDblClick
    end
  end
  object PnlAcoes: TPanel
    Left = 0
    Top = 223
    Width = 620
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 1
    ExplicitTop = 222
    ExplicitWidth = 618
  end
  object DsBusca: TDataSource
    DataSet = QryBusca
    Left = 496
    Top = 48
  end
  object QryBusca: TFDQuery
    Left = 304
    Top = 136
  end
end
