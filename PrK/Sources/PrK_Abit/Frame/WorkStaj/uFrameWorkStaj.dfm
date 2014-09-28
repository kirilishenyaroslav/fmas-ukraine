object FrameWorkStaj: TFrameWorkStaj
  Left = 0
  Top = 0
  Width = 588
  Height = 369
  TabOrder = 0
  object cxGroupBoxCalcWorkStaj: TcxGroupBox
    Left = 286
    Top = 0
    Width = 302
    Height = 369
    Align = alRight
    Alignment = alTopLeft
    Caption = 'cxGroupBoxCalcWorkStaj'
    TabOrder = 0
    object cxGridCalcStaj: TcxGrid
      Left = 2
      Top = 15
      Width = 298
      Height = 289
      Align = alClient
      TabOrder = 0
      object cxGridCalcStajTableView1: TcxGridTableView
        DataController.Filter.Criteria = {FFFFFFFF0000000000}
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OnCustomDrawCell = cxGridCalcStajTableView1CustomDrawCell
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsCustomize.ColumnFiltering = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.NewItemRow = True
        object colDateBeg: TcxGridColumn
          Caption = 'colDateBeg'
          PropertiesClassName = 'TcxDateEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 113
        end
        object colDateEnd: TcxGridColumn
          Caption = 'DateEnd'
          PropertiesClassName = 'TcxDateEditProperties'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 105
        end
        object colSpecStaj: TcxGridColumn
          Caption = 'colSpecStaj'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayUnchecked = 'False'
          Properties.NullStyle = nssInactive
          Properties.ValueChecked = 1
          Properties.ValueGrayed = 0
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 78
        end
      end
      object cxGridCalcStajLevel1: TcxGridLevel
        GridView = cxGridCalcStajTableView1
      end
    end
    object cxGroupBoxButton: TcxGroupBox
      Left = 2
      Top = 304
      Width = 298
      Height = 63
      Align = alBottom
      Alignment = alTopLeft
      TabOrder = 1
      object cxButtonCalc: TcxButton
        Left = 57
        Top = 22
        Width = 110
        Height = 27
        Cursor = crHandPoint
        Action = ActionCalc
        DragCursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
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
          FF00FF00FF00FF00FF00FF00FF00000000000084830000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00000000000084830000FFFE000084830000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000000000FFFE0000FFFE0000FFFE0000FFFE00008483000000
          0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF000000000000FFFE0000FFFE00848484008484840000FFFE0000FFFE000084
          830000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF008484840000FFFE0084848400FF00FF00FF00FF008484840000FFFE0000FF
          FE000084830000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0084848400FF00FF00FF00FF00FF00FF00FF00FF008484840000FF
          FE0000FFFE000084830000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008484
          840000FFFE0000FFFE000084830000000000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF008484840000FFFE0000FFFE0000000000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF008484840000FFFE0000000000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF0084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      end
      object cxButtonDelRec: TcxButton
        Left = 173
        Top = 22
        Width = 120
        Height = 27
        Cursor = crHandPoint
        Action = ActionCalcDeleteRec
        DragCursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
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
      end
    end
  end
  object cxSplitterCalcWorkStaj: TcxSplitter
    Left = 278
    Top = 0
    Width = 8
    Height = 369
    HotZoneClassName = 'TcxMediaPlayer9Style'
    HotZone.SizePercent = 100
    AlignSplitter = salRight
    AllowHotZoneDrag = False
    AutoPosition = False
    PositionAfterOpen = 320
    Control = cxGroupBoxCalcWorkStaj
  end
  object cxLabelMestoRaboti: TcxLabel
    Left = 10
    Top = 13
    Width = 236
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
  end
  object cxLabelDoljnost: TcxLabel
    Left = 10
    Top = 70
    Width = 249
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 3
  end
  object cxTextEditMestoRaboti: TcxTextEdit
    Left = 16
    Top = 34
    Width = 241
    Height = 21
    ParentFont = False
    Style.Color = 16776176
    TabOrder = 4
    Text = 'cxTextEditMestoRaboti'
  end
  object cxTextEditDoljnost: TcxTextEdit
    Left = 16
    Top = 94
    Width = 241
    Height = 21
    ParentFont = False
    Style.Color = 16776176
    TabOrder = 5
    Text = 'cxTextEditDoljnost'
  end
  object cxLabelAllStaj: TcxLabel
    Left = 10
    Top = 142
    Width = 124
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 6
  end
  object cxLabelSpecStaj: TcxLabel
    Left = 149
    Top = 142
    Width = 122
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 7
  end
  object cxTextEditAllStaj: TcxTextEdit
    Left = 16
    Top = 167
    Width = 97
    Height = 21
    ParentFont = False
    Properties.MaxLength = 5
    Style.Color = 16776176
    TabOrder = 8
    Text = 'cxTextEditAllStaj'
    OnKeyPress = cxTextEditAllStajKeyPress
  end
  object cxTextEditSpecStaj: TcxTextEdit
    Left = 155
    Top = 167
    Width = 97
    Height = 21
    ParentFont = False
    Properties.MaxLength = 5
    Style.Color = 16776176
    TabOrder = 9
    Text = 'cxTextEditSpecStaj'
    OnKeyPress = cxTextEditSpecStajKeyPress
  end
  object WorkStaj: TActionList
    Left = 304
    Top = 322
    object ActionCalc: TAction
      Caption = 'ActionCalc'
      ImageIndex = 0
      ShortCut = 24589
      OnExecute = ActionCalcExecute
    end
    object ActionCalcDeleteRec: TAction
      Caption = 'ActionDelRec'
      ImageIndex = 1
      ShortCut = 16430
      OnExecute = ActionCalcDeleteRecExecute
    end
  end
end
