object frmDocs_AE: TfrmDocs_AE
  Left = 503
  Top = 274
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmDocs_AE'
  ClientHeight = 265
  ClientWidth = 303
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Width = 303
    Height = 225
    Align = alTop
    Alignment = alTopLeft
    TabOrder = 0
    TabStop = False
    object Status_Label: TLabel
      Left = 8
      Top = 48
      Width = 62
      Height = 13
      Caption = 'Status_Label'
    end
    object Date_Doc_Label: TLabel
      Left = 192
      Top = 8
      Width = 49
      Height = 13
      Caption = 'Date_Doc'
    end
    object TypeDocum_Label: TLabel
      Left = 8
      Top = 88
      Width = 90
      Height = 13
      Caption = 'TypeDocum_Label'
    end
    object Num_Doc_Label: TLabel
      Left = 8
      Top = 8
      Width = 80
      Height = 13
      Caption = 'Num_Doc_Label'
    end
    object DateDept_Label: TLabel
      Left = 104
      Top = 144
      Width = 78
      Height = 13
      Caption = 'DateDept_Label'
    end
    object Date_Order_Label: TLabel
      Left = 8
      Top = 168
      Width = 87
      Height = 13
      Caption = 'Date_Order_Label'
    end
    object Num_Order_Label: TLabel
      Left = 120
      Top = 168
      Width = 86
      Height = 13
      Caption = 'Num_Order_Label'
    end
    object Num_Doc_Edit: TcxTextEdit
      Left = 8
      Top = 24
      Width = 177
      Height = 21
      Properties.MaxLength = 40
      Style.Color = clInfoBk
      TabOrder = 0
      OnKeyPress = Num_Doc_EditKeyPress
    end
    object Date_Doc_Edit: TcxDateEdit
      Left = 192
      Top = 24
      Width = 105
      Height = 21
      Style.Color = clInfoBk
      TabOrder = 1
      OnKeyPress = Date_Doc_EditKeyPress
    end
    object Status_Edit: TcxButtonEdit
      Left = 8
      Top = 64
      Width = 288
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      Enabled = False
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = Status_EditPropertiesButtonClick
      Style.Color = 16311512
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonTransparency = ebtNone
      TabOrder = 2
      OnKeyPress = Status_EditKeyPress
    end
    object TypeDocum_Edit: TcxButtonEdit
      Left = 8
      Top = 104
      Width = 288
      Height = 21
      AutoSize = False
      BeepOnEnter = False
      Enabled = False
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = TypeDocum_EditPropertiesButtonClick
      Style.Color = 16311512
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonTransparency = ebtNone
      TabOrder = 3
      OnKeyPress = TypeDocum_EditKeyPress
    end
    object DateDept_Edit: TcxDateEdit
      Left = 192
      Top = 140
      Width = 105
      Height = 21
      Style.Color = clInfoBk
      TabOrder = 4
      OnKeyPress = DateDept_EditKeyPress
    end
    object Order_Date_Edit: TcxDateEdit
      Left = 6
      Top = 184
      Width = 105
      Height = 21
      Style.Color = clInfoBk
      TabOrder = 5
      OnKeyPress = Order_Date_EditKeyPress
    end
    object Order_Num_Edit: TcxTextEdit
      Left = 120
      Top = 184
      Width = 177
      Height = 21
      Properties.MaxLength = 20
      Style.Color = clInfoBk
      TabOrder = 6
      OnKeyPress = Order_Num_EditKeyPress
    end
  end
  object OKButton: TcxButton
    Left = 111
    Top = 233
    Width = 91
    Height = 25
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object CancelButton: TcxButton
    Left = 207
    Top = 233
    Width = 91
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CancelButtonClick
  end
end
