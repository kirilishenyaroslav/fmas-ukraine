object ChartForm: TChartForm
  Left = 250
  Top = 170
  Width = 724
  Height = 498
  Caption = 'ChartForm'
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
    Width = 716
    Height = 464
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1040#1085#1072#1083#1110#1079' '#1076#1086#1093#1086#1076#1085#1086#1111' '#1095#1072#1089#1090#1080#1085#1080
      object Chart1: TChart
        Left = 0
        Top = 0
        Width = 708
        Height = 436
        AllowPanning = pmNone
        AllowZoom = False
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        BackWall.Pen.Visible = False
        Title.Text.Strings = (
          #1044#1086#1093#1086#1076#1085#1072' '#1095#1072#1089#1090#1080#1085#1072' '#1073#1102#1076#1078#1077#1090#1091)
        AxisVisible = False
        ClipPoints = False
        Frame.Visible = False
        Legend.Alignment = laTop
        Legend.TextStyle = ltsLeftPercent
        Legend.TopPos = 1
        View3DOptions.Elevation = 315
        View3DOptions.HorizOffset = 5
        View3DOptions.Orthogonal = False
        View3DOptions.Perspective = 0
        View3DOptions.Rotation = 360
        View3DOptions.Zoom = 84
        View3DWalls = False
        Align = alClient
        TabOrder = 0
        object Series1: TPieSeries
          Marks.ArrowLength = 8
          Marks.Style = smsLabelPercent
          Marks.Visible = True
          SeriesColor = clRed
          Title = #1044#1086#1093#1086#1076#1080' '#1073#1102#1076#1078#1077#1090#1091
          OtherSlice.Text = 'Other'
          PieValues.DateTime = False
          PieValues.Name = 'Pie'
          PieValues.Multiplier = 1.000000000000000000
          PieValues.Order = loAscending
          RotationAngle = 20
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1040#1085#1072#1083#1110#1079' '#1074#1080#1076#1072#1090#1082#1086#1074#1086#1111' '#1095#1072#1089#1090#1080#1085#1080
      ImageIndex = 1
      object Chart2: TChart
        Left = 0
        Top = 0
        Width = 708
        Height = 436
        AllowPanning = pmNone
        AllowZoom = False
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        BackWall.Pen.Visible = False
        Title.Text.Strings = (
          #1042#1080#1076#1072#1090#1082#1086#1074#1072' '#1095#1072#1089#1090#1080#1085#1072' '#1073#1102#1076#1078#1077#1090#1091)
        AxisVisible = False
        ClipPoints = False
        Frame.Visible = False
        Legend.Alignment = laTop
        Legend.TextStyle = ltsRightPercent
        Legend.TopPos = 1
        View3DOptions.Elevation = 315
        View3DOptions.HorizOffset = 5
        View3DOptions.Orthogonal = False
        View3DOptions.Perspective = 0
        View3DOptions.Rotation = 360
        View3DOptions.Zoom = 84
        View3DWalls = False
        Align = alClient
        TabOrder = 0
        object PieSeries1: TPieSeries
          Marks.ArrowLength = 8
          Marks.Style = smsLabelPercent
          Marks.Visible = True
          SeriesColor = clRed
          Title = #1042#1080#1076#1072#1090#1082#1080' '#1073#1102#1076#1078#1077#1090#1091
          OtherSlice.Text = 'Other'
          PieValues.DateTime = False
          PieValues.Name = 'Pie'
          PieValues.Multiplier = 1.000000000000000000
          PieValues.Order = loAscending
          RotationAngle = 20
        end
      end
    end
  end
end
