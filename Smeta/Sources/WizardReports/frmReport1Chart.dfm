object frmReport1Diagram: TfrmReport1Diagram
  Left = 248
  Top = 116
  Width = 717
  Height = 454
  Caption = #1040#1085#1072#1083#1110#1079' '#1074#1072#1088#1110#1072#1085#1090#1110#1074' '#1073#1102#1076#1078#1077#1090#1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 709
    Height = 427
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet2: TTabSheet
      Caption = #1040#1085#1072#1083#1110#1079' '#1076#1086#1093#1086#1076#1085#1086#1111' '#1095#1072#1089#1090#1080#1085#1080' '#1073#1102#1076#1078#1077#1090#1091
      ImageIndex = 1
      object Chart1: TChart
        Left = 0
        Top = 0
        Width = 701
        Height = 399
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          '')
        Legend.Alignment = laTop
        Legend.LegendStyle = lsSeries
        Legend.TextStyle = ltsXValue
        Legend.TopPos = 1
        View3D = False
        Align = alClient
        TabOrder = 0
      end
    end
    object TabSheet1: TTabSheet
      Caption = #1040#1085#1072#1083#1110#1079' '#1074#1080#1076#1072#1090#1082#1086#1074#1086#1111' '#1095#1072#1089#1090#1080#1085#1080' '#1073#1102#1076#1078#1077#1090#1091
      ImageIndex = 1
      object Chart2: TChart
        Left = 0
        Top = 0
        Width = 701
        Height = 399
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          '')
        Legend.Alignment = laTop
        Legend.LegendStyle = lsSeries
        Legend.TextStyle = ltsXValue
        Legend.TopPos = 1
        View3D = False
        Align = alClient
        TabOrder = 0
      end
    end
  end
end
