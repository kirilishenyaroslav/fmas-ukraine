object fmKassaSetup: TfmKassaSetup
  Left = 265
  Top = 128
  Width = 658
  Height = 663
  Caption = 'fmKassaSetup'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnAction: TPanel
    Left = 0
    Top = 579
    Width = 650
    Height = 50
    Align = alBottom
    TabOrder = 0
    object cbtOk: TcxButton
      Left = 16
      Top = 16
      Width = 121
      Height = 25
      Caption = #1055#1110#1076#1090#1074#1077#1088#1076#1080#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = cbtOkClick
    end
    object cbtOkClose: TcxButton
      Left = 152
      Top = 16
      Width = 201
      Height = 25
      Caption = #1055#1110#1076#1090#1074#1077#1088#1076#1080#1090#1080' '#1090#1072' '#1074#1080#1081#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = cbtOkCloseClick
    end
    object cbtClose: TcxButton
      Left = 552
      Top = 16
      Width = 81
      Height = 25
      Caption = #1042#1080#1093#1110#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = cbtCloseClick
    end
    object cbtNullRow: TcxButton
      Left = 376
      Top = 16
      Width = 153
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1080#1090#1080' '#1079#1072#1087#1080#1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = cbtNullRowClick
    end
  end
  object pnHeader: TPanel
    Left = 0
    Top = 0
    Width = 650
    Height = 41
    Align = alTop
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1082#1072#1089#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object cxgKassaSetup: TcxGrid
    Left = 0
    Top = 41
    Width = 650
    Height = 538
    Align = alClient
    TabOrder = 2
    object cvKassaSetup: TcxGridDBCardView
      DataController.DataSource = dsFields
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsView.CellEndEllipsis = True
      OptionsView.ShowEditButtons = gsebAlways
      OptionsView.CaptionWidth = 340
      OptionsView.CardWidth = 640
      OptionsView.CellAutoHeight = True
      OptionsView.CellTextMaxLineCount = 2
      OptionsView.RowCaptionAutoHeight = True
      OptionsView.RowCaptionEndEllipsis = True
      Styles.Background = cxStyleBorder
      Styles.Content = cxStyleContent
      Styles.ContentEven = cxStyleContent
      Styles.ContentOdd = cxStyleContent
      Styles.Inactive = cxStyle4
      Styles.IncSearch = cxStyle11
      Styles.Selection = cxStyle17
      Styles.CaptionRow = cxStyleBorder
      Styles.CardBorder = cxStyleBorder
      Styles.RowCaption = cxStyleBorder
      object DATE_INSTALL_KASSA: TcxGridDBCardViewRow
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.DateButtons = [btnToday]
        Properties.ReadOnly = False
        Properties.SaveTime = False
        Properties.ShowTime = False
        OnCustomDrawCell = DATE_INSTALL_KASSACustomDrawCell
        Styles.Content = cxStyleContent1
        Styles.Caption = cxStyleCaption1
        DataBinding.FieldName = 'DATE_INSTALL_KASSA_V'
      end
      object ID_KASSA_LOAD: TcxGridDBCardViewRow
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = ID_KASSA_LOADPropertiesButtonClick
        OnCustomDrawCell = ID_KASSA_LOADCustomDrawCell
        Styles.Content = cxStyleContent2
        Styles.Caption = cxStyleCaption2
        DataBinding.FieldName = 'ID_KASSA_LOAD_STR'
      end
      object ID_SM: TcxGridDBCardViewRow
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = ID_SMPropertiesButtonClick
        OnCustomDrawCell = ID_SMCustomDrawCell
        Styles.Content = cxStyleNullRow
        Styles.Caption = cxStyleNullRow
        DataBinding.FieldName = 'ID_SM_STR'
      end
      object ID_RAZD: TcxGridDBCardViewRow
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = ID_RAZDPropertiesButtonClick
        OnCustomDrawCell = ID_RAZDCustomDrawCell
        Styles.Content = cxStyleYellow
        Styles.Caption = cxStyleNullRow
        DataBinding.FieldName = 'ID_RAZD_STR'
      end
      object ID_ST: TcxGridDBCardViewRow
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = ID_STPropertiesButtonClick
        OnCustomDrawCell = ID_STCustomDrawCell
        Styles.Content = cxStyleNullRow
        Styles.Caption = cxStyleNullRow
        DataBinding.FieldName = 'ID_ST_STR'
      end
      object PREDVARIT_PROV: TcxGridDBCardViewRow
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.DropDownListStyle = lsFixedList
        Properties.DropDownRows = 2
        Properties.Items.Strings = (
          #1058#1072#1082
          #1053#1110)
        Properties.ReadOnly = False
        DataBinding.FieldName = 'PREDVARIT_PROV_STR'
      end
      object KASSA_BEGIN_PERIOD: TcxGridDBCardViewRow
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.DateButtons = [btnToday]
        Properties.ReadOnly = False
        OnCustomDrawCell = KASSA_BEGIN_PERIODCustomDrawCell
        Styles.Content = cxStyleNullRow
        Styles.Caption = cxStyleNullRow
        DataBinding.FieldName = 'KASSA_BEGIN_PERIOD_V'
      end
      object KASSA_DAY_SHOW_LAST: TcxGridDBCardViewRow
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.EditMask = '9999 ;1; '
        OnCustomDrawCell = KASSA_DAY_SHOW_LASTCustomDrawCell
        Styles.Content = cxStyleNullRow
        Styles.Caption = cxStyleNullRow
        DataBinding.FieldName = 'KASSA_DAY_SHOW_LAST_V'
      end
      object NDS: TcxGridDBCardViewRow
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = ',0.00'
        Properties.OnValidate = NDSPropertiesValidate
        OnCustomDrawCell = NDSCustomDrawCell
        Styles.Content = cxStyleNullRow
        Styles.Caption = cxStyleNullRow
        DataBinding.FieldName = 'NDS_V'
      end
      object PRINT_PASPORT: TcxGridDBCardViewRow
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.DropDownListStyle = lsFixedList
        Properties.DropDownRows = 2
        Properties.Items.Strings = (
          #1058#1072#1082
          #1053#1110)
        Properties.ReadOnly = False
        DataBinding.FieldName = 'PRINT_PASPORT_STR'
      end
      object ID_GROUP_DOG: TcxGridDBCardViewRow
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = ID_GROUP_DOGPropertiesButtonClick
        OnCustomDrawCell = ID_GROUP_DOGCustomDrawCell
        Styles.Content = cxStyleNullRow
        Styles.Caption = cxStyleNullRow
        DataBinding.FieldName = 'ID_GROUP_DOG_STR'
      end
      object ID_GROUP_ADD_PR: TcxGridDBCardViewRow
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = ID_GROUP_ADD_PRPropertiesButtonClick
        OnCustomDrawCell = ID_GROUP_ADD_PRCustomDrawCell
        Styles.Content = cxStyleNullRow
        Styles.Caption = cxStyleNullRow
        DataBinding.FieldName = 'ID_GROUP_ADD_PR_STR'
      end
      object ID_GROUP_ADD_RAS: TcxGridDBCardViewRow
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = ID_GROUP_ADD_RASPropertiesButtonClick
        OnCustomDrawCell = ID_GROUP_ADD_RASCustomDrawCell
        Styles.Content = cxStyleNullRow
        Styles.Caption = cxStyleNullRow
        DataBinding.FieldName = 'ID_GROUP_ADD_RAS_STR'
      end
      object ID_TYPE_DOG_KOMANDIR: TcxGridDBCardViewRow
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = ID_TYPE_DOG_KOMANDIRPropertiesButtonClick
        OnCustomDrawCell = ID_TYPE_DOG_KOMANDIRCustomDrawCell
        Styles.Content = cxStyleNullRow
        Styles.Caption = cxStyleNullRow
        DataBinding.FieldName = 'ID_TYPE_DOG_KOMANDIR_STR'
      end
      object MAKE_PROVERKA_TO_BUFF: TcxGridDBCardViewRow
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.DropDownListStyle = lsFixedList
        Properties.DropDownRows = 2
        Properties.Items.Strings = (
          #1058#1072#1082
          #1053#1110)
        Properties.ReadOnly = False
        DataBinding.FieldName = 'MAKE_PROVERKA_TO_BUFF_STR'
      end
      object ID_TYPE_DOG_HOS: TcxGridDBCardViewRow
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = ID_TYPE_DOG_HOSPropertiesButtonClick
        OnCustomDrawCell = ID_TYPE_DOG_HOSCustomDrawCell
        Styles.Content = cxStyleNullRow
        Styles.Caption = cxStyleNullRow
        DataBinding.FieldName = 'ID_TYPE_DOG_HOS_STR'
      end
      object OTCHET_COMMENT_SHOW: TcxGridDBCardViewRow
        Caption = 'OTCHET_COMMENT_SHOW'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.DropDownListStyle = lsEditFixedList
        Properties.DropDownRows = 3
        Properties.Items.Strings = (
          #1047#1074#1110#1090' '#1082#1072#1089#1080#1088#1072
          #1047#1074#1110#1090' '#1082#1072#1089#1080#1088#1072' ('#1074#1072#1088#1110#1072#1085#1090' 2)'
          #1050#1072#1089#1086#1074#1072' '#1082#1085#1080#1075#1072)
        Properties.ReadOnly = False
        DataBinding.FieldName = 'OTCHET_COMMENT_SHOW_STR'
      end
      object USE_ACCESS: TcxGridDBCardViewRow
        Caption = 'USE_ACCESS'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.DropDownListStyle = lsFixedList
        Properties.DropDownRows = 2
        Properties.Items.Strings = (
          #1058#1072#1082
          #1053#1110)
        Properties.ReadOnly = False
        DataBinding.FieldName = 'USE_ACCESS_STR'
      end
      object USE_BARCODE: TcxGridDBCardViewRow
        Caption = 'USE_BARCODE'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.DropDownListStyle = lsFixedList
        Properties.DropDownRows = 2
        Properties.Items.Strings = (
          #1058#1072#1082
          #1053#1110)
        Properties.ReadOnly = False
        DataBinding.FieldName = 'USE_BARCODE_STR'
      end
      object BARCODE_PRIH: TcxGridDBCardViewRow
        Caption = 'BARCODE_PRIH'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.DropDownListStyle = lsFixedList
        Properties.DropDownRows = 3
        Properties.Items.Strings = (
          #1042#1080#1076#1072#1090#1082#1086#1074#1110
          #1055#1088#1080#1073#1091#1090#1082#1086#1074#1110
          #1055#1088#1080#1073#1091#1090#1082#1086#1074#1110' '#1110' '#1074#1080#1076#1072#1090#1082#1086#1074#1110)
        Properties.ReadOnly = False
        DataBinding.FieldName = 'BARCODE_PRIH_STR'
      end
      object PRINT_DEFAULT: TcxGridDBCardViewRow
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        Properties.OnButtonClick = PRINT_DEFAULTPropertiesButtonClick
        Styles.Content = cxStyleNullRow
        Styles.Caption = cxStyleNullRow
        DataBinding.FieldName = 'PRINT_DEFAULT_STR'
      end
    end
    object lvKassaSetup: TcxGridLevel
      GridView = cvKassaSetup
    end
  end
  object fdbFull: TpFIBDatabase
    DBParams.Strings = (
      'lc_ctype=WIN1251'
      'password=masterkey'
      'user_name=SYSDBA')
    DefaultTransaction = ftrRead
    DefaultUpdateTransaction = trWrite
    SQLDialect = 3
    Timeout = 0
    DesignDBOptions = []
    WaitForRestoreConnect = 0
    Left = 8
    Top = 8
  end
  object ftrRead: TpFIBTransaction
    DefaultDatabase = fdbFull
    TimeoutAction = TARollback
    Left = 40
    Top = 8
  end
  object fdsFields: TpFIBDataSet
    Database = fdbFull
    Transaction = ftrFields
    SelectSQL.Strings = (
      'SELECT *'
      'FROM KASSA_SELECT_INI_INSTALL')
    Left = 120
    Top = 8
    poSQLINT64ToBCD = True
    object fdsFieldsDATE_INSTALL_KASSA_V: TFIBDateField
      FieldName = 'DATE_INSTALL_KASSA_V'
    end
    object fdsFieldsID_KASSA_LOAD_V: TFIBBCDField
      FieldName = 'ID_KASSA_LOAD_V'
      Size = 0
      RoundByScale = True
    end
    object fdsFieldsID_SM_V: TFIBBCDField
      FieldName = 'ID_SM_V'
      Size = 0
      RoundByScale = True
    end
    object fdsFieldsID_RAZD_V: TFIBBCDField
      FieldName = 'ID_RAZD_V'
      Size = 0
      RoundByScale = True
    end
    object fdsFieldsID_ST_V: TFIBBCDField
      FieldName = 'ID_ST_V'
      Size = 0
      RoundByScale = True
    end
    object fdsFieldsPREDVARIT_PROV_V: TFIBSmallIntField
      FieldName = 'PREDVARIT_PROV_V'
    end
    object fdsFieldsKASSA_BEGIN_PERIOD_V: TFIBDateField
      FieldName = 'KASSA_BEGIN_PERIOD_V'
    end
    object fdsFieldsKASSA_DAY_SHOW_LAST_V: TFIBIntegerField
      FieldName = 'KASSA_DAY_SHOW_LAST_V'
    end
    object fdsFieldsNDS_V: TFIBBCDField
      FieldName = 'NDS_V'
      Size = 2
      RoundByScale = True
    end
    object fdsFieldsPRINT_PASPORT_V: TFIBSmallIntField
      FieldName = 'PRINT_PASPORT_V'
    end
    object fdsFieldsID_GROUP_DOG_V: TFIBBCDField
      FieldName = 'ID_GROUP_DOG_V'
      Size = 0
      RoundByScale = True
    end
    object fdsFieldsID_GROUP_ADD_PR_V: TFIBBCDField
      FieldName = 'ID_GROUP_ADD_PR_V'
      Size = 0
      RoundByScale = True
    end
    object fdsFieldsID_GROUP_ADD_RAS_V: TFIBBCDField
      FieldName = 'ID_GROUP_ADD_RAS_V'
      Size = 0
      RoundByScale = True
    end
    object fdsFieldsID_TYPE_DOG_KOMANDIR_V: TFIBBCDField
      FieldName = 'ID_TYPE_DOG_KOMANDIR_V'
      Size = 0
      RoundByScale = True
    end
    object fdsFieldsID_TYPE_DOG_HOS_V: TFIBBCDField
      FieldName = 'ID_TYPE_DOG_HOS_V'
      Size = 0
      RoundByScale = True
    end
    object fdsFieldsMAKE_PROVERKA_TO_BUFF_V: TFIBIntegerField
      FieldName = 'MAKE_PROVERKA_TO_BUFF_V'
    end
    object fdsFieldsDATE_INSTALL_KASSA_N: TFIBStringField
      FieldName = 'DATE_INSTALL_KASSA_N'
      Size = 150
      EmptyStrToNull = True
    end
    object fdsFieldsID_KASSA_LOAD_N: TFIBStringField
      FieldName = 'ID_KASSA_LOAD_N'
      Size = 150
      EmptyStrToNull = True
    end
    object fdsFieldsID_SM_N: TFIBStringField
      FieldName = 'ID_SM_N'
      Size = 150
      EmptyStrToNull = True
    end
    object fdsFieldsID_RAZD_N: TFIBStringField
      FieldName = 'ID_RAZD_N'
      Size = 150
      EmptyStrToNull = True
    end
    object fdsFieldsID_ST_N: TFIBStringField
      FieldName = 'ID_ST_N'
      Size = 150
      EmptyStrToNull = True
    end
    object fdsFieldsPREDVARIT_PROV_N: TFIBStringField
      FieldName = 'PREDVARIT_PROV_N'
      Size = 150
      EmptyStrToNull = True
    end
    object fdsFieldsKASSA_BEGIN_PERIOD_N: TFIBStringField
      FieldName = 'KASSA_BEGIN_PERIOD_N'
      Size = 150
      EmptyStrToNull = True
    end
    object fdsFieldsKASSA_DAY_SHOW_LAST_N: TFIBStringField
      FieldName = 'KASSA_DAY_SHOW_LAST_N'
      Size = 150
      EmptyStrToNull = True
    end
    object fdsFieldsNDS_N: TFIBStringField
      FieldName = 'NDS_N'
      Size = 150
      EmptyStrToNull = True
    end
    object fdsFieldsPRINT_PASPORT_N: TFIBStringField
      FieldName = 'PRINT_PASPORT_N'
      Size = 150
      EmptyStrToNull = True
    end
    object fdsFieldsID_GROUP_DOG_N: TFIBStringField
      FieldName = 'ID_GROUP_DOG_N'
      Size = 150
      EmptyStrToNull = True
    end
    object fdsFieldsID_GROUP_ADD_PR_N: TFIBStringField
      FieldName = 'ID_GROUP_ADD_PR_N'
      Size = 150
      EmptyStrToNull = True
    end
    object fdsFieldsID_GROUP_ADD_RAS_N: TFIBStringField
      FieldName = 'ID_GROUP_ADD_RAS_N'
      Size = 150
      EmptyStrToNull = True
    end
    object fdsFieldsID_TYPE_DOG_KOMANDIR_N: TFIBStringField
      FieldName = 'ID_TYPE_DOG_KOMANDIR_N'
      Size = 150
      EmptyStrToNull = True
    end
    object fdsFieldsID_TYPE_DOG_HOS_N: TFIBStringField
      FieldName = 'ID_TYPE_DOG_HOS_N'
      Size = 150
      EmptyStrToNull = True
    end
    object fdsFieldsMAKE_PROVERKA_TO_BUFF_N: TFIBStringField
      FieldName = 'MAKE_PROVERKA_TO_BUFF_N'
      Size = 150
      EmptyStrToNull = True
    end
    object fdsFieldsID_KASSA_LOAD_STR: TFIBStringField
      FieldName = 'ID_KASSA_LOAD_STR'
      Size = 50
      EmptyStrToNull = True
    end
    object fdsFieldsID_SM_STR: TFIBStringField
      FieldName = 'ID_SM_STR'
      Size = 200
      EmptyStrToNull = True
    end
    object fdsFieldsID_ST_STR: TFIBStringField
      FieldName = 'ID_ST_STR'
      Size = 200
      EmptyStrToNull = True
    end
    object fdsFieldsID_RAZD_STR: TFIBStringField
      FieldName = 'ID_RAZD_STR'
      Size = 200
      EmptyStrToNull = True
    end
    object fdsFieldsPREDVARIT_PROV_STR: TFIBStringField
      FieldName = 'PREDVARIT_PROV_STR'
      Size = 5
      EmptyStrToNull = True
    end
    object fdsFieldsPRINT_PASPORT_STR: TFIBStringField
      FieldName = 'PRINT_PASPORT_STR'
      Size = 5
      EmptyStrToNull = True
    end
    object fdsFieldsID_GROUP_DOG_STR: TFIBStringField
      FieldName = 'ID_GROUP_DOG_STR'
      Size = 80
      EmptyStrToNull = True
    end
    object fdsFieldsID_GROUP_ADD_PR_STR: TFIBStringField
      FieldName = 'ID_GROUP_ADD_PR_STR'
      Size = 80
      EmptyStrToNull = True
    end
    object fdsFieldsID_GROUP_ADD_RAS_STR: TFIBStringField
      FieldName = 'ID_GROUP_ADD_RAS_STR'
      Size = 80
      EmptyStrToNull = True
    end
    object fdsFieldsID_TYPE_DOG_KOMANDIR_STR: TFIBStringField
      FieldName = 'ID_TYPE_DOG_KOMANDIR_STR'
      Size = 255
      EmptyStrToNull = True
    end
    object fdsFieldsID_TYPE_DOG_HOS_STR: TFIBStringField
      FieldName = 'ID_TYPE_DOG_HOS_STR'
      Size = 255
      EmptyStrToNull = True
    end
    object fdsFieldsMAKE_PROVERKA_TO_BUFF_STR: TFIBStringField
      FieldName = 'MAKE_PROVERKA_TO_BUFF_STR'
      Size = 5
      EmptyStrToNull = True
    end
    object fdsFieldsOTCHET_COMMENT_SHOW_V: TFIBIntegerField
      FieldName = 'OTCHET_COMMENT_SHOW_V'
    end
    object fdsFieldsUSE_ACCESS_V: TFIBIntegerField
      FieldName = 'USE_ACCESS_V'
    end
    object fdsFieldsBARCODE_PRIH_V: TFIBIntegerField
      FieldName = 'BARCODE_PRIH_V'
    end
    object fdsFieldsUSE_BARCODE_V: TFIBIntegerField
      FieldName = 'USE_BARCODE_V'
    end
    object fdsFieldsOTCHET_COMMENT_SHOW_STR: TFIBStringField
      FieldName = 'OTCHET_COMMENT_SHOW_STR'
      Size = 25
      EmptyStrToNull = True
    end
    object fdsFieldsUSE_ACCESS_STR: TFIBStringField
      FieldName = 'USE_ACCESS_STR'
      Size = 5
      EmptyStrToNull = True
    end
    object fdsFieldsBARCODE_PRIH_STR: TFIBStringField
      FieldName = 'BARCODE_PRIH_STR'
      Size = 25
      EmptyStrToNull = True
    end
    object fdsFieldsUSE_BARCODE_STR: TFIBStringField
      FieldName = 'USE_BARCODE_STR'
      Size = 5
      EmptyStrToNull = True
    end
    object fdsFieldsOTCHET_COMMENT_SHOW_N: TFIBStringField
      FieldName = 'OTCHET_COMMENT_SHOW_N'
      Size = 100
      EmptyStrToNull = True
    end
    object fdsFieldsUSE_ACCESS_N: TFIBStringField
      FieldName = 'USE_ACCESS_N'
      Size = 100
      EmptyStrToNull = True
    end
    object fdsFieldsBARCODE_PRIH_N: TFIBStringField
      FieldName = 'BARCODE_PRIH_N'
      Size = 100
      EmptyStrToNull = True
    end
    object fdsFieldsUSE_BARCODE_N: TFIBStringField
      FieldName = 'USE_BARCODE_N'
      Size = 100
      EmptyStrToNull = True
    end
    object fdsFieldsPRINT_DEFAULT_V: TFIBIntegerField
      FieldName = 'PRINT_DEFAULT_V'
    end
    object fdsFieldsPRINT_DEFAULT_STR: TFIBStringField
      FieldName = 'PRINT_DEFAULT_STR'
      Size = 100
      EmptyStrToNull = True
    end
    object fdsFieldsPRINT_DEFAULT_N: TFIBStringField
      FieldName = 'PRINT_DEFAULT_N'
      Size = 50
      EmptyStrToNull = True
    end
  end
  object ftrFields: TpFIBTransaction
    DefaultDatabase = fdbFull
    TimeoutAction = TARollback
    Left = 152
    Top = 8
  end
  object dsFields: TDataSource
    DataSet = rxmFields
    Left = 184
    Top = 8
  end
  object rxmFields: TRxMemoryData
    FieldDefs = <
      item
        Name = 'DATE_INSTALL_KASSA_N'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'ID_KASSA_LOAD_N'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'ID_SM_N'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'ID_RAZD_N'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'ID_ST_N'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'PREDVARIT_PROV_N'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'KASSA_BEGIN_PERIOD_N'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'KASSA_DAY_SHOW_LAST_N'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'NDS_N'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'PRINT_PASPORT_N'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'ID_GROUP_ADD_RAS_N'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'ID_GROUP_DOG_N'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'ID_GROUP_ADD_PR_N'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'ID_TYPE_DOG_KOMANDIR_N'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'ID_TYPE_DOG_HOS_N'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'MAKE_PROVERKA_TO_BUFF_N'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'OTCHET_COMMENT_SHOW_N'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'USE_ACCESS_N'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'USE_BARCODE_N'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'BARCODE_PRIH_N'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'PRINT_DEFAULT_N'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DATE_INSTALL_KASSA_V'
        DataType = ftVariant
      end
      item
        Name = 'ID_KASSA_LOAD_V'
        DataType = ftVariant
      end
      item
        Name = 'ID_SM_V'
        DataType = ftVariant
      end
      item
        Name = 'ID_RAZD_V'
        DataType = ftVariant
      end
      item
        Name = 'ID_ST_V'
        DataType = ftVariant
      end
      item
        Name = 'PREDVARIT_PROV_V'
        DataType = ftVariant
      end
      item
        Name = 'KASSA_DAY_SHOW_LAST_V'
        DataType = ftVariant
      end
      item
        Name = 'KASSA_BEGIN_PERIOD_V'
        DataType = ftVariant
      end
      item
        Name = 'NDS_V'
        Attributes = [faFixed]
        DataType = ftVariant
      end
      item
        Name = 'ID_GROUP_DOG_V'
        DataType = ftVariant
      end
      item
        Name = 'PRINT_PASPORT_V'
        DataType = ftVariant
      end
      item
        Name = 'ID_GROUP_ADD_PR_V'
        DataType = ftVariant
      end
      item
        Name = 'ID_GROUP_ADD_RAS_V'
        DataType = ftVariant
      end
      item
        Name = 'ID_TYPE_DOG_KOMANDIR_V'
        DataType = ftVariant
      end
      item
        Name = 'ID_TYPE_DOG_HOS_V'
        DataType = ftVariant
      end
      item
        Name = 'MAKE_PROVERKA_TO_BUFF_V'
        DataType = ftVariant
      end
      item
        Name = 'OTCHET_COMMENT_SHOW_V'
        DataType = ftVariant
      end
      item
        Name = 'USE_ACCESS_V'
        DataType = ftVariant
      end
      item
        Name = 'USE_BARCODE_V'
        DataType = ftVariant
      end
      item
        Name = 'BARCODE_PRIH_V'
        DataType = ftVariant
      end
      item
        Name = 'PRINT_DEFAULT_V'
        DataType = ftInteger
      end
      item
        Name = 'ID_KASSA_LOAD_STR'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ID_SM_STR'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'ID_RAZD_STR'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'ID_ST_STR'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'ID_GROUP_DOG_STR'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'ID_GROUP_ADD_PR_STR'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'PREDVARIT_PROV_STR'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ID_GROUP_ADD_RAS_STR'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'PRINT_PASPORT_STR'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'MAKE_PROVERKA_TO_BUFF_STR'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ID_TYPE_DOG_KOMANDIR_STR'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ID_TYPE_DOG_HOS_STR'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'OTCHET_COMMENT_SHOW_STR'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'USE_ACCESS_STR'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'USE_BARCODE_STR'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'BARCODE_PRIH_STR'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'PRINT_DEFAULT_STR'
        DataType = ftString
        Size = 100
      end>
    Left = 216
    Top = 8
  end
  object StyleRepository: TcxStyleRepository
    Left = 608
    Top = 16
    object cxStyle4: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyleYellow: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15204351
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
    end
    object cxStyleFontBlack: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyleMalin: TcxStyle
      AssignedValues = [svColor]
      Color = 4194368
    end
    object cxStyleBorder: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStylemalinYellow: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 4194368
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 15204351
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyleGrid: TcxStyle
      AssignedValues = [svColor]
      Color = 10485760
    end
    object cxStyleContent: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyleBackground: TcxStyle
      AssignedValues = [svColor]
      Color = clInactiveBorder
    end
    object cxStyleNullRow: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clActiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyleCaption1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clActiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyleCaption2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clMedGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyleContent1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyleContent2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 11337211
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle4
      Styles.Content = cxStyle5
      Styles.ContentEven = cxStyle6
      Styles.ContentOdd = cxStyle7
      Styles.Inactive = cxStyle13
      Styles.IncSearch = cxStyle14
      Styles.Selection = cxStyle17
      Styles.FilterBox = cxStyle8
      Styles.Footer = cxStyle9
      Styles.Group = cxStyle10
      Styles.GroupByBox = cxStyle11
      Styles.Header = cxStyle12
      Styles.Indicator = cxStyle15
      Styles.Preview = cxStyle16
      BuiltIn = True
    end
  end
  object fdsProcedure: TpFIBDataSet
    Database = fdbFull
    Transaction = ftrProcedure
    SelectSQL.Strings = (
      'SELECT SHORT_NAME_KASS'
      'FROM KASSA_SP_KASS'
      'WHERE ID_SP_KASS = :Id_kassa_load_v')
    Left = 424
    Top = 8
    poSQLINT64ToBCD = True
  end
  object ftrProcedure: TpFIBTransaction
    DefaultDatabase = fdbFull
    TimeoutAction = TARollback
    Left = 456
    Top = 8
  end
  object fspKassaIniIstall: TpFIBStoredProc
    Database = fdbFull
    Transaction = trWrite
    Left = 472
    Top = 57
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = fdbFull
    TimeoutAction = TARollback
    Left = 72
    Top = 9
  end
end
