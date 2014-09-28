object FormClassAction: TFormClassAction
  Left = 193
  Top = 114
  Width = 780
  Height = 586
  Caption = 'FormClassActions'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 457
    Top = 0
    Width = 3
    Height = 540
    Cursor = crHSplit
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 540
    Width = 772
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object GroupBoxCalsses: TGroupBox
    Left = 0
    Top = 0
    Width = 457
    Height = 540
    Align = alLeft
    Caption = 'Классы '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object ToolBar2: TToolBar
      Left = 2
      Top = 15
      Width = 453
      Height = 19
      AutoSize = True
      ButtonHeight = 19
      ButtonWidth = 112
      Caption = 'ToolBar2'
      EdgeBorders = []
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      List = True
      ParentFont = False
      ShowCaptions = True
      TabOrder = 0
      object ToolButtonAddClass: TToolButton
        Left = 0
        Top = 0
        AutoSize = True
        Caption = 'Добавить'
        ImageIndex = 0
      end
      object ToolButtonEditClass: TToolButton
        Left = 66
        Top = 0
        AutoSize = True
        Caption = 'Изменить'
        ImageIndex = 1
      end
      object ToolButton1: TToolButton
        Left = 133
        Top = 0
        AutoSize = True
        Caption = 'Добавить действие'
        ImageIndex = 2
      end
      object ToolButton2: TToolButton
        Left = 249
        Top = 0
        AutoSize = True
        Caption = 'Удалить действие'
        ImageIndex = 3
      end
    end
    object TreeView1: TTreeView
      Left = 2
      Top = 34
      Width = 453
      Height = 504
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Indent = 19
      ParentFont = False
      TabOrder = 1
    end
  end
  object GroupBoxActions: TGroupBox
    Left = 460
    Top = 0
    Width = 312
    Height = 540
    Align = alClient
    Caption = 'Действия '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 2
      Top = 34
      Width = 308
      Height = 504
      Align = alClient
      DataSource = DataSourceActions
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NAME_ACTION'
          Title.Alignment = taCenter
          Title.Caption = 'Название'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 96
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FULL_NAME_ACTION'
          Title.Alignment = taCenter
          Title.Caption = 'Полное название'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 313
          Visible = True
        end>
    end
    object ToolBar1: TToolBar
      Left = 2
      Top = 15
      Width = 308
      Height = 19
      AutoSize = True
      ButtonHeight = 19
      ButtonWidth = 63
      Caption = 'ToolBar1'
      EdgeBorders = []
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      List = True
      ParentFont = False
      ShowCaptions = True
      TabOrder = 1
      object ToolButtonAddAction: TToolButton
        Left = 0
        Top = 0
        Action = AddAction
        AutoSize = True
      end
      object ToolButtonEditAction: TToolButton
        Left = 61
        Top = 0
        Action = EditAction
        AutoSize = True
      end
    end
  end
  object IBQueryActions: TIBQuery
    Database = DMMain.KruAccessDB
    Transaction = IBTransactionActions
    CachedUpdates = False
    SQL.Strings = (
      'select * from ACTIONS')
    Left = 564
    Top = 168
  end
  object IBTransactionActions: TIBTransaction
    Active = False
    DefaultDatabase = DMMain.KruAccessDB
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 596
    Top = 168
  end
  object DataSourceActions: TDataSource
    DataSet = IBQueryActions
    Left = 532
    Top = 168
  end
  object ActionList: TActionList
    Left = 532
    Top = 200
    object AddAction: TAction
      Category = 'Actions'
      Caption = 'Добавить'
      OnExecute = AddActionExecute
    end
    object EditAction: TAction
      Category = 'Actions'
      Caption = 'Изменить'
      OnExecute = EditActionExecute
    end
  end
end
