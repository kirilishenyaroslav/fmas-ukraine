object dt_IntMoving_Plan_EditorForm: Tdt_IntMoving_Plan_EditorForm
  Left = 192
  Top = 113
  Width = 870
  Height = 640
  Caption = #1056#1077#1076#1072#1082#1090#1086#1088' '#1087#1083#1072#1085#1110#1074' '#1074#1080#1093#1110#1076#1085#1086#1111' '#1074#1086#1076#1080
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
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TreeList: TcxTreeList
    Left = 8
    Top = 88
    Width = 769
    Height = 337
    Bands = <
      item
        Caption.Text = 'Band1'
        Width = 191
      end>
    BufferedPaint = False
    TabOrder = 0
    object id_Dep_Column: TcxTreeListColumn
      DataBinding.ValueType = 'String'
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
      Visible = False
    end
    object id_Object_Column: TcxTreeListColumn
      DataBinding.ValueType = 'String'
      Position.ColIndex = 4
      Position.RowIndex = 0
      Position.BandIndex = 0
      Visible = False
      Width = 120
    end
    object id_Cat_Cust_Column: TcxTreeListColumn
      DataBinding.ValueType = 'String'
      Position.ColIndex = 5
      Position.RowIndex = 0
      Position.BandIndex = 0
      Visible = False
      Width = 120
    end
    object id_Product_Column: TcxTreeListColumn
      DataBinding.ValueType = 'String'
      Position.ColIndex = 6
      Position.RowIndex = 0
      Position.BandIndex = 0
      Visible = False
      Width = 120
    end
    object Name_Column: TcxTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.Text = #1055#1110#1076#1088#1086#1079#1076#1110#1083'/'#1054#1073#39#1108#1082#1090'/'#1050#1072#1090#1077#1075#1086#1088#1110#1103
      DataBinding.ValueType = 'String'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      Width = 509
    end
    object Volume_Column: TcxTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.Text = #1054#1073#39#1108#1084
      DataBinding.ValueType = 'String'
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
      Width = 242
    end
    object Charge_Column: TcxTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.AlignVert = vaCenter
      Caption.GlyphAlignHorz = taCenter
      Caption.GlyphAlignVert = vaCenter
      Caption.Text = #1042#1090#1088#1072#1090#1080
      DataBinding.ValueType = 'String'
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
      Width = 241
    end
  end
  object DateBegEdit: TcxDateEdit
    Left = 8
    Top = 8
    Width = 121
    Height = 21
    Properties.SaveTime = False
    Properties.ShowTime = False
    TabOrder = 1
  end
  object DateEndEdit: TcxDateEdit
    Left = 136
    Top = 8
    Width = 121
    Height = 21
    Properties.SaveTime = False
    Properties.ShowTime = False
    TabOrder = 2
  end
  object CalcButton: TcxButton
    Left = 262
    Top = 5
    Width = 75
    Height = 25
    Caption = #1056#1086#1079#1088#1072#1093#1091#1074#1072#1090#1080
    TabOrder = 3
    OnClick = CalcButtonClick
  end
  object DataSet: TpFIBDataSet
    Database = dm.DataBase
    Transaction = dm.ReadTransaction
    Left = 344
    Top = 8
    poSQLINT64ToBCD = True
  end
end
