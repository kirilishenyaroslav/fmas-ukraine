object fmBankNich: TfmBankNich
  Left = 480
  Top = 360
  BorderStyle = bsSingle
  Caption = #1060#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103' '#1053#1030#1063
  ClientHeight = 586
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 129
    Align = alTop
    Color = clGradientActiveCaption
    TabOrder = 0
    DesignSize = (
      784
      129)
    object lbl_num_doc: TLabel
      Left = 16
      Top = 12
      Width = 91
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    end
    object lbl_date_doc: TLabel
      Left = 328
      Top = 12
      Width = 14
      Height = 13
      Caption = #1074#1110#1076
    end
    object lbl_sum_doc: TLabel
      Left = 472
      Top = 12
      Width = 83
      Height = 13
      Caption = #1057#1091#1084#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    end
    object lbl_pidstava: TLabel
      Left = 16
      Top = 32
      Width = 45
      Height = 13
      Caption = #1055#1110#1076#1089#1090#1072#1074#1072
    end
    object lbl1: TLabel
      Left = 16
      Top = 68
      Width = 58
      Height = 13
      Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
    end
    object lbl2: TLabel
      Left = 16
      Top = 104
      Width = 18
      Height = 13
      Caption = #1056'/'#1088
    end
    object lbl3: TLabel
      Left = 312
      Top = 104
      Width = 28
      Height = 13
      Caption = #1052#1060#1054
    end
    object lbl4: TLabel
      Left = 520
      Top = 104
      Width = 25
      Height = 13
      Caption = #1041#1072#1085#1082
    end
    object cxNum_doc: TcxTextEdit
      Left = 224
      Top = 8
      Width = 89
      Height = 21
      ParentFont = False
      Properties.ReadOnly = True
      Style.Color = 16776176
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
    object cxDate_doc: TcxDateEdit
      Left = 352
      Top = 8
      Width = 97
      Height = 21
      ParentFont = False
      Properties.ReadOnly = True
      Style.Color = 16776176
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
    end
    object cxSum_doc: TcxTextEdit
      Left = 568
      Top = 8
      Width = 121
      Height = 21
      ParentFont = False
      Properties.ReadOnly = True
      Style.Color = 16776176
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
    object cxMemo1: TcxMemo
      Left = 88
      Top = 32
      Width = 677
      Height = 33
      Align = alCustom
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Properties.ReadOnly = True
      Style.Color = 16776176
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 3
    end
    object cxNameCustEdit: TcxTextEdit
      Left = 88
      Top = 72
      Width = 677
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Properties.ReadOnly = True
      Style.Color = 16776176
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 7
    end
    object cxRREdit: TcxTextEdit
      Left = 88
      Top = 98
      Width = 161
      Height = 21
      ParentFont = False
      Properties.ReadOnly = True
      Style.Color = 16776176
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
    end
    object cxMFOEdit: TcxTextEdit
      Left = 360
      Top = 98
      Width = 81
      Height = 21
      ParentFont = False
      Properties.ReadOnly = True
      Style.Color = 16776176
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
    end
    object cxBankEdit: TcxTextEdit
      Left = 568
      Top = 98
      Width = 198
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Properties.ReadOnly = True
      Style.Color = 16776176
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 6
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 165
    Width = 481
    Height = 371
    Align = alLeft
    TabOrder = 2
    object cxParamGrid: TcxGrid
      Left = 1
      Top = 1
      Width = 479
      Height = 369
      Align = alClient
      TabOrder = 0
      object cxParamGridTableView1: TcxGridTableView
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            Column = cxParamGridTableView1ColumnSum
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OnFocusedRecordChanged = cxParamGridTableView1FocusedRecordChanged
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        object cxParamGridTableView1ColumnMonth: TcxGridColumn
          Caption = #1052#1030#1089#1103#1094#1100
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.Grouping = False
          Options.Moving = False
          Options.Sorting = False
          Width = 100
        end
        object cxParamGridTableView1ColumnYear: TcxGridColumn
          Caption = #1056#1110#1082
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.Grouping = False
          Options.Moving = False
          Options.Sorting = False
          Width = 72
        end
        object cxParamGridTableView1ColumnSmt: TcxGridColumn
          Caption = #1043#1088#1091#1087#1072' '#1073#1102#1076#1078#1077#1090#1072
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.Grouping = False
          Options.Moving = False
          Options.Sorting = False
          Width = 104
        end
        object cxParamGridTableView1ColumnRazd: TcxGridColumn
          Caption = #1056#1086#1079#1076#1110#1083
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.Grouping = False
          Options.Moving = False
          Options.Sorting = False
          Width = 98
        end
        object cxParamGridTableView1ColumnSum: TcxGridColumn
          Caption = #1057#1091#1084#1072
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.Grouping = False
          Options.Moving = False
          Options.Sorting = False
          Width = 103
        end
        object cxParamGridTableView1month: TcxGridColumn
          Visible = False
          Options.Sorting = False
        end
        object cxParamGridTableView1SmGroup: TcxGridColumn
          Visible = False
          Options.Sorting = False
        end
        object cxParamGridTableView1IdRazd: TcxGridColumn
          Visible = False
          Options.Sorting = False
        end
        object cxParamGridTableView1SmGroupText: TcxGridColumn
          Visible = False
          Options.Sorting = False
        end
        object cxParamGridTableView1RazdText: TcxGridColumn
          Visible = False
          Options.Sorting = False
        end
      end
      object cxParamGridLevel1: TcxGridLevel
        GridView = cxParamGridTableView1
      end
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 481
    Top = 165
    Width = 8
    Height = 371
    Cursor = crHSplit
    NativeBackground = False
    MinSize = 10
    Control = pnl2
    Color = clActiveCaption
    ParentColor = False
  end
  object pnl3: TPanel
    Left = 489
    Top = 165
    Width = 295
    Height = 371
    Align = alClient
    Caption = 'pnl3'
    TabOrder = 3
    object cxResultGrid: TcxGrid
      Left = 1
      Top = 1
      Width = 293
      Height = 369
      Align = alClient
      TabOrder = 0
      object cxResultGridDBTableView1: TcxGridDBTableView
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            Column = cxResultGridDBTableView1DBColumn4
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        object cxResultGridDBTableView1DBColumn1: TcxGridDBColumn
          Caption = #1041#1102#1076#1078#1077#1090
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Options.Grouping = False
          Options.Moving = False
        end
        object cxResultGridDBTableView1DBColumn2: TcxGridDBColumn
          Caption = #1056#1086#1079#1076#1110#1083
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Options.Grouping = False
          Options.Moving = False
        end
        object cxResultGridDBTableView1DBColumn3: TcxGridDBColumn
          Caption = #1057#1090#1072#1090#1090#1103
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Options.Grouping = False
          Options.Moving = False
        end
        object cxResultGridDBTableView1DBColumn4: TcxGridDBColumn
          Caption = #1057#1091#1084#1072
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Options.Grouping = False
          Options.Moving = False
        end
        object cxResultGridDBTableView1DBColumn5: TcxGridDBColumn
          Visible = False
        end
        object cxResultGridDBTableView1DBColumn6: TcxGridDBColumn
          Visible = False
        end
        object cxResultGridDBTableView1DBColumn7: TcxGridDBColumn
          Visible = False
        end
        object cxResultGridDBTableView1DBColumn8: TcxGridDBColumn
          Visible = False
        end
        object cxResultGridDBTableView1DBColumn9: TcxGridDBColumn
          Visible = False
        end
        object cxResultGridDBTableView1DBColumn10: TcxGridDBColumn
          Visible = False
        end
        object cxResultGridDBTableView1DBColumn11: TcxGridDBColumn
          Visible = False
        end
        object cxResultGridDBTableView1DBColumn12: TcxGridDBColumn
          Visible = False
        end
        object cxResultGridDBTableView1DBColumn13: TcxGridDBColumn
          Visible = False
        end
        object cxResultGridDBTableView1DBColumn14: TcxGridDBColumn
          Visible = False
        end
        object cxResultGridDBTableView1DBColumn15: TcxGridDBColumn
          Visible = False
        end
        object cxResultGridDBTableView1DBColumn16: TcxGridDBColumn
          Visible = False
        end
      end
      object cxResultGridLevel1: TcxGridLevel
        GridView = cxResultGridDBTableView1
      end
    end
  end
  object pnl4: TPanel
    Left = 0
    Top = 536
    Width = 784
    Height = 50
    Align = alBottom
    TabOrder = 4
    object Label2: TLabel
      Left = 16
      Top = 8
      Width = 3
      Height = 13
    end
    object cxButtonCancel: TcxButton
      Left = 680
      Top = 5
      Width = 91
      Height = 25
      Cursor = crHandPoint
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      TabOrder = 0
      OnClick = cxButtonCancelClick
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00000084000000840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0000008400000084000000840084848400FF00FF00FF00FF00FF00FF00FF00
        FF00000084000000840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000008400000084000000840084848400FF00FF00FF00FF000000
        84000000840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000008400000084000000840084848400000084000000
        840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00000084000000840000008400000084000000
        8400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00000084000000FF00000084008484
        8400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00000084000000840000008400000084000000
        840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00000084000000840000008400FF00FF00000084000000
        84000000840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00000084000000840000008400FF00FF00FF00FF00FF00FF000000
        8400000084000000840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00000084000000840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00000084000000840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000000840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000840000008400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      LookAndFeel.Kind = lfFlat
      UseSystemPaint = False
    end
    object cxButtonOk: TcxButton
      Left = 568
      Top = 5
      Width = 91
      Height = 25
      Cursor = crHandPoint
      Caption = #1055#1088#1080#1081#1085#1103#1090#1080
      TabOrder = 1
      OnClick = cxButtonOkClick
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00000000000084840000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00000000000084840000FFFF000084840000000000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000000000FFFF0000FFFF0000FFFF0000FFFF00008484000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000000000000FFFF0000FFFF00848484008484840000FFFF0000FFFF000084
        840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF008484840000FFFF0084848400FF00FF00FF00FF008484840000FFFF0000FF
        FF000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0084848400FF00FF00FF00FF00FF00FF00FF00FF008484840000FF
        FF0000FFFF000084840000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008484
        840000FFFF0000FFFF000084840000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF008484840000FFFF0000FFFF0000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF008484840000FFFF0000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      LookAndFeel.Kind = lfFlat
      UseSystemPaint = False
    end
    object Label1: TcxMemo
      Left = 104
      Top = 6
      Width = 377
      Height = 41
      ParentFont = False
      Style.BorderStyle = ebsNone
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
  end
  object pnl5: TPanel
    Left = 0
    Top = 129
    Width = 784
    Height = 36
    Align = alTop
    TabOrder = 5
    object cxButtonAdd: TcxButton
      Left = 8
      Top = 5
      Width = 91
      Height = 25
      Cursor = crHandPoint
      Caption = #1044#1086#1076#1072#1090#1080
      TabOrder = 0
      OnClick = cxButtonAddClick
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00B58C8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A
        5A008C5A5A008C5A5A008C5A5A008C5A5A00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00B58C8C00FFF7E700F7EFDE00F7EFDE00F7EFDE00F7EF
        DE00F7EFDE00F7EFDE00F7E7CE008C5A5A00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00B58C8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DE
        C600F7DEC600EFDECE00EFDECE008C5A5A00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00B58C8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6
        A500FFD6A500FFD6A500EFDECE008C5A5A00FF00FF00FF00FF00B58C8C008C5A
        5A008C5A5A008C5A5A00B58C8C00FFF7EF00F7DEC600F7DEC600F7DEC600F7DE
        C600F7DEBD00F7E7CE00EFDECE009C6B6300FF00FF00FF00FF00B58C8C00FFF7
        E700F7EFDE00F7EFDE00B58C8C00FFF7EF00F7E7CE00F7DEC600F7DEC600F7DE
        C600F7DEC600F7E7D600EFDECE009C6B6B00FF00FF00FF00FF00B58C8C00F7EF
        DE00F7DECE00F7DEC600B58C8C00FFFFF700FFD6A500FFD6A500FFD6A5004A84
        4A004A844A004A844A004A844A00A57B7300FF00FF00FF00FF00B58C8C00FFF7
        E700FFD6A500FFD6A500B58C8C00FFFFF700FFE7D600FFE7D600F7E7D6004A84
        4A0052AD520052AD52004A844A00A57B7300FF00FF00FF00FF00B58C8C00FFF7
        EF00F7DEC600F7DEC600B58C8C00FFFFFF00FFFFFF004A844A004A844A004A84
        4A0052AD520052AD52004A844A004A844A004A844A00FF00FF00B58C8C00FFF7
        EF00F7E7CE00F7DEC600B58C8C00FFFFFF00FFFFFF004A844A0052AD520052AD
        520052AD520052AD520052AD520052AD52004A844A00FF00FF00B58C8C00FFFF
        F700FFD6A500FFD6A500B58C8C00FFFFFF00FFFFFF004A844A006BCE84006BCE
        84006BCE840052AD520052AD520052AD52004A844A00FF00FF00B58C8C00FFFF
        F700FFE7D600FFE7D600B58C8C00B58C8C00B58C8C004A844A004A844A004A84
        4A006BCE840052AD52004A844A004A844A004A844A00FF00FF00B58C8C00FFFF
        FF00FFFFFF00FFFFFF00FFFFF700FFFFF700EFDEDE00D6C6C600BDADAD004A84
        4A006BCE840052AD52004A844A00FF00FF00FF00FF00FF00FF00B58C8C00FFFF
        FF00FFFFFF00FFFFFF00FFFFF700FFFFF700B58C8C00B58C8C00B58C8C004A84
        4A004A844A004A844A004A844A00FF00FF00FF00FF00FF00FF00B58C8C00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B58C8C00EFB56B00C68C7B00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00B58C8C00B58C
        8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00BD848400FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      LookAndFeel.Kind = lfFlat
      UseSystemPaint = False
    end
    object cxButtonEdit: TcxButton
      Left = 104
      Top = 5
      Width = 91
      Height = 25
      Cursor = crHandPoint
      Caption = #1047#1084#1110#1085#1080#1090#1080
      TabOrder = 1
      OnClick = cxButtonEditClick
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF008C5A
        5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
        5A008C5A5A008C5A5A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00F7EF
        DE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDE
        CE00F7EFDE008C5A5A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00F7EF
        DE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDE
        CE00F7EFDE008C5A5A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFF7
        E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6
        A500F7E7CE008C5A5A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFF7
        E700F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DEBD00F7E7
        CE00F7E7CE008C5A5A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00F7EF
        DE00F7DECE00F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600F7DEC600EFDE
        CE00EFDECE008C5A5A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFF7
        E70042424200FFD6A50042424200FFD6A50018181800FFD6A500FFD6A500FFD6
        A500EFDECE009C6B6300FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFF7
        EF00F7DEC600F7DEC600F7DEC6001818180018181800F7DEC600F7DEBD00F7E7
        CE00EFDECE009C6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFF7
        EF00F7E7CE00F7DEC600181818001818180018181800F7DEC600F7DEC600F7E7
        D600EFDECE009C6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFF
        F700FFD6A500181818008484840000FFFF0018181800FFD6A500FFD6A500FFD6
        A500EFDECE009C6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFF
        F700FFE7D60018181800C6C6C60000FFFF0018181800FFE7D600FF00FF00FF00
        FF00FF00FF009C6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFF
        FF00181818008484840000FFFF0018181800FFFFF700FFFFF700FF00FF00FFFF
        FF00C68C7B00CED6D600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF004242
        420084848400C6C6C60000FFFF0018181800FFFFFF00FFFFFF00FF00FF00C68C
        7B00CED6D600CED6D600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF001818
        18001818180000FFFF0018181800FF00FF00FF00FF00FF00FF00FF00FF00CED6
        D600CED6D600CED6D600FF00FF00FF00FF00FF00FF00FF00FF00181818000000
        84000000840018181800CED6D600CED6D600CED6D600CED6D600CED6D600CED6
        D600CED6D600CED6D600FF00FF00FF00FF00FF00FF00FF00FF00CED6D6001818
        18001818180018181800CED6D600CED6D600CED6D600CED6D600CED6D600CED6
        D600CED6D600CED6D600FF00FF00FF00FF00FF00FF00FF00FF00}
      LookAndFeel.Kind = lfFlat
      UseSystemPaint = False
    end
    object cxButtonDel: TcxButton
      Left = 200
      Top = 5
      Width = 91
      Height = 25
      Cursor = crHandPoint
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      TabOrder = 2
      OnClick = cxButtonDelClick
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00B58C8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
        5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A00FF00FF00FF00FF00FF00
        FF00FF00FF00B58C8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DE
        C600F7DEC600F7DEC600EFDECE00F7EFDE008C5A5A00FF00FF00FF00FF00FF00
        FF00FF00FF00B58C8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DE
        C600F7DEC600F7DEC600EFDECE00F7EFDE008C5A5A00FF00FF00FF00FF00FF00
        FF00FF00FF00B58C8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6
        A500FFD6A500FFD6A500FFD6A500F7E7CE008C5A5A00FF00FF00FF00FF00FF00
        FF000000FF00B58C8C00FFF7E700F7DEC600F7DEC600F7DEC600F7DEC600F7DE
        C600F7DEC600F7DEBD00F7E7CE00F7E7CE008C5A5A00FF00FF00FF00FF00FF00
        FF000000FF0000008400F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DE
        C600F7DEC6000000FF00EFDECE00EFDECE008C5A5A00FF00FF00FF00FF00FF00
        FF00FF00FF000000FF0000008400FFD6A500FFD6A500FFD6A500FFD6A500FFD6
        A500000084000000FF00FFD6A500EFDECE009C6B6300FF00FF00FF00FF00FF00
        FF00FF00FF006B6BFF0000008400F7DEC600F7DEC600F7DEC600F7DEC6000000
        84000000FF00F7DEBD00F7E7CE00EFDECE009C6B6B00FF00FF00FF00FF00FF00
        FF00FF00FF00B58C8C000000FF0000008400F7DEC600F7DEC600000084000000
        FF00F7DEC600F7DEC600F7E7D600EFDECE009C6B6B00FF00FF00FF00FF00FF00
        FF00FF00FF00B58C8C00FFFFF7000000FF0000008400000084000000FF00FFD6
        A500FFD6A500FFD6A500FFD6A500EFDECE009C6B6B00FF00FF00FF00FF00FF00
        FF00FF00FF00B58C8C00FFFFF7000000FF000000FF000000FF00FFE7D600FFE7
        D600FFE7D600B58C8C00B58C8C00B58C8C009C6B6B00FF00FF00FF00FF00FF00
        FF00FF00FF00B58C8C000000FF00000084000000FF0000008400FFFFFF00FFFF
        F700FFFFF700B58C8C00FFFFFF00C68C7B00FF00FF00FF00FF00FF00FF00FF00
        FF000000FF000000FF0000008400FFFFFF00FFFFFF000000FF0000008400FFFF
        FF00FFFFFF00B58C8C00C68C7B00FF00FF00FF00FF00FF00FF00FF00FF000000
        FF000000FF00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C000000FF000000
        8400B58C8C00B58C8C00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      LookAndFeel.Kind = lfFlat
      UseSystemPaint = False
    end
  end
  object DB: TpFIBDatabase
    DefaultTransaction = pFIBTransaction1
    SQLDialect = 1
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 504
    Top = 200
  end
  object ds1: TDataSource
    DataSet = pFIBDataSet1
    Left = 504
    Top = 232
  end
  object pFIBDataSet1: TpFIBDataSet
    Database = DB
    Transaction = pFIBTransaction1
    AutoCommit = True
    SelectSQL.Strings = (
      '')
    Left = 504
    Top = 272
    poSQLINT64ToBCD = True
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = DB
    TimeoutAction = TARollback
    TPBMode = tpbDefault
    Left = 504
    Top = 312
  end
  object IBQuery1: TpFIBQuery
    Left = 392
    Top = 129
    qoAutoCommit = True
    qoStartTransaction = True
  end
end
