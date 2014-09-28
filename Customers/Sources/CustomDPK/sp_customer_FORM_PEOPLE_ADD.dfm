object fsp_customer_form_people_add: Tfsp_customer_form_people_add
  Left = 293
  Top = 314
  BorderStyle = bsDialog
  ClientHeight = 261
  ClientWidth = 378
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 361
    Height = 201
    TabOrder = 0
    object LabelPOST: TLabel
      Left = 16
      Top = 16
      Width = 45
      Height = 13
      Caption = #1055#1086#1089#1072#1076#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelFIRSTNAME: TLabel
      Left = 192
      Top = 16
      Width = 58
      Height = 13
      Caption = #1055#1088#1110#1079#1074#1080#1097#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object labelNAME: TLabel
      Left = 16
      Top = 64
      Width = 24
      Height = 13
      Caption = #1030#1084#39#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelLAST_NAME: TLabel
      Left = 192
      Top = 64
      Width = 72
      Height = 13
      Caption = #1055#1086' '#1073#1072#1090#1100#1082#1086#1074#1110
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelPRIM: TLabel
      Left = 16
      Top = 112
      Width = 47
      Height = 13
      Caption = #1055#1088#1080#1084#1110#1090#1082#1072
    end
    object TypeMenEdit: TcxButtonEdit
      Left = 16
      Top = 32
      Width = 153
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.HideCursor = True
      Properties.ReadOnly = True
      Properties.OnButtonClick = TypeMenEditButtonClick
      Style.Color = clMoneyGreen
      TabOrder = 0
    end
    object FamiliaEdit: TcxTextEdit
      Left = 192
      Top = 32
      Width = 153
      Height = 21
      Properties.MaxLength = 30
      Style.Color = clMoneyGreen
      TabOrder = 1
    end
    object ImyaEdit: TcxTextEdit
      Left = 16
      Top = 80
      Width = 153
      Height = 21
      Properties.MaxLength = 30
      Style.Color = clMoneyGreen
      TabOrder = 2
    end
    object OtchestvoEdit: TcxTextEdit
      Left = 192
      Top = 80
      Width = 153
      Height = 21
      Properties.MaxLength = 30
      Style.Color = clMoneyGreen
      TabOrder = 3
    end
    object NotesMemo: TcxMemo
      Left = 16
      Top = 128
      Width = 329
      Height = 57
      Properties.MaxLength = 254
      Style.Color = clMoneyGreen
      TabOrder = 4
    end
  end
  object Button1: TcxButton
    Left = 184
    Top = 224
    Width = 91
    Height = 25
    Caption = #1055#1088#1080#1081#1085#1103#1090#1080
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TcxButton
    Left = 280
    Top = 224
    Width = 91
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 2
    OnClick = Button2Click
  end
end
