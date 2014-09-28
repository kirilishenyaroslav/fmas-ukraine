object FormUsersGroups: TFormUsersGroups
  Left = 191
  Top = 113
  Width = 810
  Height = 572
  Caption = 'Пользователи и группы'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 802
    Height = 29
    Caption = 'ToolBar1'
    EdgeBorders = [ebTop, ebBottom]
    TabOrder = 0
  end
  object TabControlGroupUser: TTabControl
    Left = 0
    Top = 29
    Width = 802
    Height = 497
    Align = alClient
    TabOrder = 1
    Tabs.Strings = (
      'Группы'
      'Пользователи')
    TabIndex = 0
    OnChanging = TabControlGroupUserChanging
    object Splitter1: TSplitter
      Left = 409
      Top = 24
      Width = 3
      Height = 469
      Cursor = crHSplit
    end
    object DBGridMain: TDBGrid
      Left = 4
      Top = 24
      Width = 405
      Height = 469
      Align = alLeft
      DataSource = DataSourceMain
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NAME'
          Title.Alignment = taCenter
          Title.Caption = 'Название'
          Width = 136
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FULL_NAME'
          Title.Alignment = taCenter
          Title.Caption = 'Полнон название'
          Width = 224
          Visible = True
        end>
    end
    object DBGridDetail: TDBGrid
      Left = 412
      Top = 24
      Width = 386
      Height = 469
      Align = alClient
      DataSource = DataSourceDetail
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NAME'
          Title.Alignment = taCenter
          Title.Caption = 'Название'
          Width = 113
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FULL_NAME'
          Title.Alignment = taCenter
          Title.Caption = 'Полное название'
          Width = 209
          Visible = True
        end>
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 526
    Width = 802
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object queryMain: TIBQuery
    Database = DMMain.KruAccessDB
    Transaction = DMMain.DefaultTransaction
    Active = True
    AfterScroll = queryMainAfterScroll
    CachedUpdates = False
    SQL.Strings = (
      'select * from ROLES')
    Left = 136
    Top = 181
  end
  object queryDetail: TIBQuery
    Database = DMMain.KruAccessDB
    Transaction = DMMain.DefaultTransaction
    CachedUpdates = False
    SQL.Strings = (
      'select USERS.*,  USERS_ROLES.ID_ROLE'
      'from USERS, USERS_ROLES '
      'where USERS_ROLES.ID_USER = USERS.ID_USER'
      'and USERS_ROLES.ID_ROLE = :PID_ROLE')
    Left = 432
    Top = 181
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PID_ROLE'
        ParamType = ptUnknown
      end>
  end
  object DataSourceMain: TDataSource
    DataSet = queryMain
    Left = 136
    Top = 149
  end
  object DataSourceDetail: TDataSource
    DataSet = queryDetail
    Left = 432
    Top = 149
  end
end
