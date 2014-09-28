object frmEmailMForm: TfrmEmailMForm
  Left = 348
  Top = 163
  Width = 835
  Height = 550
  Caption = #1056#1086#1079#1089#1080#1083#1082#1072' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1110#1074' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 471
    Width = 819
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton2: TcxButton
      Left = 536
      Top = 8
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1080#1090#1080
      TabOrder = 0
      OnClick = cxButton2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 819
    Height = 177
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 24
      Top = 208
      Width = 5
      Height = 16
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxButton3: TcxButton
      Left = 559
      Top = 4
      Width = 161
      Height = 53
      Caption = #1050#1086#1085#1092#1110#1075#1091#1088#1072#1094#1110#1103' '#1088#1086#1079#1089#1080#1083#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      WordWrap = True
      OnClick = cxButton3Click
      LookAndFeel.Kind = lfStandard
    end
    object cxButton5: TcxButton
      Left = 197
      Top = 93
      Width = 179
      Height = 49
      Caption = #1055#1077#1088#1077#1088#1074#1072#1090#1080' '#1074#1080#1082#1086#1085#1072#1085#1085#1103' '#1086#1087#1077#1088#1072#1094#1110#1111
      TabOrder = 1
      Visible = False
      OnClick = cxButton5Click
      LookAndFeel.Kind = lfStandard
    end
    object ProgressBar1: TProgressBar
      Left = 1
      Top = 151
      Width = 817
      Height = 25
      Align = alBottom
      TabOrder = 2
    end
    object cxRadioButton1: TcxRadioButton
      Left = 21
      Top = 13
      Width = 268
      Height = 17
      Caption = #1056#1086#1079#1089#1080#1083#1082#1072' '#1074#1110#1076#1086#1084#1086#1089#1090#1077#1081' '#1079#1072' '#1087#1077#1088#1110#1086#1076
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      TabStop = True
    end
    object cxRadioButton2: TcxRadioButton
      Left = 21
      Top = 34
      Width = 228
      Height = 17
      Caption = #1030#1085#1092#1086#1088#1084#1072#1094#1110#1081#1085#1072' '#1088#1086#1079#1089#1080#1083#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      TabStop = True
    end
    object cxRadioButton3: TcxRadioButton
      Left = 21
      Top = 56
      Width = 252
      Height = 17
      Caption = #1056#1086#1079#1089#1080#1083#1082#1072' '#1087#1072#1088#1086#1083#1103' '#1076#1086#1089#1090#1091#1087#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      TabStop = True
    end
    object cxButton9: TcxButton
      Left = 561
      Top = 93
      Width = 161
      Height = 49
      Caption = #1030#1089#1090#1086#1088#1110#1103' '#1088#1086#1079#1089#1080#1083#1086#1082
      TabOrder = 6
      WordWrap = True
      OnClick = cxButton9Click
      LookAndFeel.Kind = lfStandard
    end
    object MonthesList: TcxComboBox
      Left = 294
      Top = 12
      Width = 105
      Height = 21
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'January'
        'February')
      TabOrder = 7
    end
    object YearSpinEdit: TcxSpinEdit
      Left = 396
      Top = 12
      Width = 60
      Height = 21
      Properties.Alignment.Horz = taLeftJustify
      Properties.BeepOnError = True
      Properties.CanEdit = False
      Properties.MaxValue = 2050.000000000000000000
      Properties.MinValue = 2000.000000000000000000
      TabOrder = 8
      Value = 2000
    end
    object cxButton1: TcxButton
      Left = 22
      Top = 93
      Width = 171
      Height = 49
      Caption = #1047#1088#1086#1073#1080#1090#1080' '#1088#1086#1079#1089#1080#1083#1082#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      OnClick = cxButton1Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000C40E0000C40E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00CC8888888888
        8888CACC888888888888CAAACC8888888888CAAAAACC88888888CAAAAAAACC88
        8888CAAAAAAAAACC8888CAAAAAAAAAAACC88CAAAAAAAAAAAAACCCAAAAAAAAAAA
        AACCCAAAAAAAAAAACC88CAAAAAAAAACC8888CAAAAAAACC888888CAAAAACC8888
        8888CAAACC8888888888CACC888888888888CC88888888888888}
      Layout = blGlyphRight
      LookAndFeel.Kind = lfStandard
      UseSystemPaint = False
      OnGetDrawParams = cxButton1GetDrawParams
    end
    object cxButton10: TcxButton
      Left = 380
      Top = 93
      Width = 178
      Height = 49
      Caption = #1055#1077#1088#1077#1075#1077#1085#1077#1088#1091#1074#1072#1090#1080' '#1087#1072#1088#1086#1083#1110
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      WordWrap = True
      OnClick = cxButton10Click
      LookAndFeel.Kind = lfStandard
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 177
    Width = 819
    Height = 294
    Align = alClient
    Caption = 'Panel3'
    TabOrder = 2
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 817
      Height = 292
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      OnChange = PageControl1Change
      object TabSheet1: TTabSheet
        Caption = #1057#1087#1080#1089#1086#1082' '#1072#1076#1088#1077#1089#1072#1090#1110#1074
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 809
          Height = 41
          Align = alTop
          TabOrder = 0
          object cxButton4: TcxButton
            Left = 10
            Top = 8
            Width = 177
            Height = 25
            Caption = #1047#1072#1074#1072#1085#1090#1072#1078#1080#1090#1080' '#1072#1076#1088#1077#1089#1072#1090#1110#1074
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = cxButton4Click
          end
          object cxButton6: TcxButton
            Left = 194
            Top = 8
            Width = 103
            Height = 25
            Caption = #1055#1086#1079#1085#1072#1095#1080#1090#1080' '#1074#1089#1110
            TabOrder = 1
            OnClick = cxButton6Click
          end
          object cxButton7: TcxButton
            Left = 306
            Top = 8
            Width = 119
            Height = 25
            Caption = #1047#1085#1103#1090#1080' '#1087#1086#1084#1110#1090#1082#1091' '#1110#1079' '#1074#1089#1110#1093
            TabOrder = 2
            OnClick = cxButton7Click
          end
          object cxButton8: TcxButton
            Left = 434
            Top = 8
            Width = 119
            Height = 25
            Caption = #1030#1085#1074#1077#1088#1090#1091#1074#1072#1090#1080' '#1074#1089#1110
            TabOrder = 3
            OnClick = cxButton8Click
          end
        end
        object cxGrid1: TcxGrid
          Left = 0
          Top = 41
          Width = 809
          Height = 223
          Align = alClient
          TabOrder = 1
          object cxGridDBTableView1: TcxGridDBTableView
            DataController.DataSource = ContactsDataSource
            DataController.Filter.Criteria = {FFFFFFFF0000000000}
            DataController.KeyFieldNames = 'ID_MAN'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = #1042#1110#1076#1110#1073#1088#1072#1085#1086': 0 '#1072#1076#1088#1077#1089#1072#1090#1110#1074
                Kind = skCount
                FieldName = 'TN'
                Column = fio
              end>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OnEditValueChanged = cxGridDBTableView1EditValueChanged
            OptionsBehavior.IncSearch = True
            OptionsBehavior.IncSearchItem = fio
            OptionsView.ColumnAutoWidth = True
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.HeaderAutoHeight = True
            Styles.StyleSheet = GridTableViewStyleSheetDevExpress
            Styles.ContentEven = cxStyle2
            Styles.ContentOdd = cxStyle2
            Styles.OnGetContentStyle = cxGridDBTableView1StylesGetContentStyle
            object TN: TcxGridDBColumn
              Caption = #1058#1053
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.Filtering = False
              Options.Moving = False
              Width = 51
              DataBinding.FieldName = 'TN'
            end
            object fio: TcxGridDBColumn
              Caption = #1055'.'#1030'.'#1041'. '#1072#1076#1088#1077#1089#1072#1090#1091
              PropertiesClassName = 'TcxButtonEditProperties'
              Properties.Buttons = <
                item
                  Default = True
                  Kind = bkEllipsis
                end>
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.Moving = False
              SortOrder = soAscending
              Width = 168
              DataBinding.FieldName = 'fio'
            end
            object cxGridDBTableView1DBColumn7: TcxGridDBColumn
              Caption = '?'
              PropertiesClassName = 'TcxButtonEditProperties'
              Properties.Buttons = <
                item
                  Default = True
                  Kind = bkEllipsis
                end>
              Properties.OnButtonClick = cxGridDBTableView1DBColumn7PropertiesButtonClick
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Options.Moving = False
              Width = 21
            end
            object email_adress: TcxGridDBColumn
              Caption = #1040#1076#1088#1077#1089#1072' '#1076#1086#1089#1090#1072#1074#1082#1080
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.Moving = False
              Width = 180
              DataBinding.FieldName = 'contact_value'
            end
            object cxGridDBTableView1DBColumn6: TcxGridDBColumn
              Caption = #1063#1080' '#1074#1110#1076#1110#1089#1083#1072#1085#1086' '#1087#1072#1088#1086#1083#1100'?'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentHorz = taCenter
              Options.Editing = False
              Options.Moving = False
              Width = 77
              DataBinding.FieldName = 'PWDisSEND_text'
            end
            object cxGridDBTableView1DBColumn4: TcxGridDBColumn
              Caption = #1055#1077#1088#1110#1086#1076' '#1088#1086#1079#1089#1080#1083#1082#1080
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.Moving = False
              Width = 119
              DataBinding.FieldName = 'SPERIOD'
            end
            object cxGridDBTableView1DBColumn5: TcxGridDBColumn
              Caption = #1055#1077#1088#1110#1086#1076' '#1076#1110#1111' '#1072#1076#1088#1077#1089#1080
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Editing = False
              Options.Moving = False
              Width = 110
              DataBinding.FieldName = 'EPERIOD'
            end
            object is_select: TcxGridDBColumn
              Caption = #1047#1088#1086#1073#1080#1090#1080' '#1088#1086#1079#1089#1080#1083#1082#1091
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.DisplayUnchecked = 'False'
              Properties.ValueChecked = 1
              Properties.ValueUnchecked = 0
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Options.Filtering = False
              Options.Moving = False
              Width = 81
              DataBinding.FieldName = 'is_select'
            end
            object id_man: TcxGridDBColumn
              Visible = False
              DataBinding.FieldName = 'id_man'
            end
            object u_password: TcxGridDBColumn
              Visible = False
              DataBinding.FieldName = 'U_PASSWORD'
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = cxGridDBTableView1
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = #1055#1088#1086#1090#1086#1082#1086#1083' '#1074#1080#1082#1086#1085#1072#1085#1085#1103' '#1086#1087#1077#1088#1072#1094#1110#1111
        ImageIndex = 1
        object cxMemo1: TListBox
          Left = 0
          Top = 33
          Width = 809
          Height = 231
          Align = alClient
          Color = 16247513
          Columns = 2
          ItemHeight = 13
          TabOrder = 0
          TabWidth = 200
        end
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 809
          Height = 33
          Align = alTop
          TabOrder = 1
        end
      end
    end
  end
  object WorkDatabase: TpFIBDatabase
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = ReadTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 320
  end
  object ConfDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 48
    Top = 256
    poSQLINT64ToBCD = True
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TACommit
    Left = 80
    Top = 256
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = WorkDatabase
    TimeoutAction = TARollback
    Left = 80
    Top = 288
  end
  object ContactsDataSet: TpFIBDataSet
    Database = WorkDatabase
    Transaction = ReadTransaction
    Left = 49
    Top = 320
    poSQLINT64ToBCD = True
  end
  object SMTP: TIdSMTP
    SASLMechanisms = <>
    Left = 16
    Top = 288
  end
  object IdMessage: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CharSet = 'windows-1251'
    CCList = <>
    Encoding = meMIME
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    OnInitializeISO = IdMessageInitializeISO
    Left = 48
    Top = 416
  end
  object Zip1: TZip
    RelativeDir = byItem
    Attributes = [fsZeroAttr, fsReadOnly, fsArchive, fsCompressed, fsEncrypted]
    DeleteOptions = doAllowUndo
    ArcType = atZip
    AttributesEx = [fsReparsePoints]
    CompressMethod = cmDeflate
    DefaultExt = '.zip'
    SeedDataKeys.Key0 = 305419896
    SeedDataKeys.Key1 = 591751049
    SeedDataKeys.Key2 = 878082192
    SeedHeaderKeys.Key0 = 269766672
    SeedHeaderKeys.Key1 = 33834504
    SeedHeaderKeys.Key2 = 541352064
    StoreFilesOfType.Strings = (
      '.ace'
      '.arc'
      '.arj'
      '.bh'
      '.bz'
      '.bz2'
      '.cab'
      '.enc'
      '.gz'
      '.ha'
      '.jar'
      '.lha'
      '.lzh'
      '.mbf'
      '.mim'
      '.pak'
      '.pk3'
      '.pk_'
      '.rar'
      '.sqx'
      '.tar'
      '.tbz'
      '.tgz'
      '.uue'
      '.uu'
      '.war'
      '.xxe'
      '.z'
      '.zap'
      '.zip'
      '.zoo'
      '.ztv')
    TempDir = 'C:\Users\'#1055#1088#1077#1087#1086#1076#1072#1074#1072#1090#1077#1083#1100'\AppData\Local\Temp\'
    Switch = swAdd
    Left = 80
    Top = 320
  end
  object Styles: TcxStyleRepository
    Left = 16
    Top = 352
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clGray
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10382168
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13249860
      TextColor = clWhite
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle2
      Styles.ContentEven = cxStyle3
      Styles.ContentOdd = cxStyle4
      Styles.Inactive = cxStyle10
      Styles.IncSearch = cxStyle11
      Styles.Selection = cxStyle14
      Styles.FilterBox = cxStyle5
      Styles.Footer = cxStyle6
      Styles.Group = cxStyle7
      Styles.GroupByBox = cxStyle8
      Styles.Header = cxStyle9
      Styles.Indicator = cxStyle12
      Styles.Preview = cxStyle13
      BuiltIn = True
    end
  end
  object ContactsDataSource: TDataSource
    DataSet = ContactsRxMemoryData
    Left = 47
    Top = 352
  end
  object ContactsRxMemoryData: TRxMemoryData
    FieldDefs = <>
    Left = 77
    Top = 354
  end
  object IdPOP31: TIdPOP3
    AutoLogin = True
    SASLMechanisms = <>
    Left = 13
    Top = 386
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 48
    Top = 384
  end
  object IMAP: TclImap4
    Left = 77
    Top = 386
  end
  object clMailMessage1: TclMailMessage
    Date = 40484.605482754630000000
    CharSet = 'windows-1251'
    ContentType = 'text/plain'
    MimeOLE = 'Produced By Clever Internet Suite MimeOLE v 6.2'
    Left = 77
    Top = 418
  end
end
