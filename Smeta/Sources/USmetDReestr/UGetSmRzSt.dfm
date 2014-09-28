object frmGetSmRzSt: TfrmGetSmRzSt
  Left = 326
  Top = 251
  BorderStyle = bsDialog
  ClientHeight = 289
  ClientWidth = 565
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 565
    Height = 248
    Align = alClient
    TabOrder = 0
    object Bevel2: TBevel
      Left = 24
      Top = 25
      Width = 257
      Height = 216
    end
    object Bevel1: TBevel
      Left = 288
      Top = 24
      Width = 257
      Height = 217
    end
    object Label1: TLabel
      Left = 41
      Top = 26
      Width = 58
      Height = 16
      Caption = #1041#1102#1076#1078#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 41
      Top = 93
      Width = 51
      Height = 16
      Caption = #1056#1086#1079#1076#1110#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 41
      Top = 166
      Width = 52
      Height = 16
      Caption = #1057#1090#1072#1090#1090#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 305
      Top = 26
      Width = 58
      Height = 16
      Caption = #1041#1102#1076#1078#1077#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 305
      Top = 93
      Width = 51
      Height = 16
      Caption = #1056#1086#1079#1076#1110#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 305
      Top = 165
      Width = 52
      Height = 16
      Caption = #1057#1090#1072#1090#1090#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 109
      Top = 5
      Width = 55
      Height = 16
      Caption = #1044#1045#1041#1045#1058
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 388
      Top = 5
      Width = 63
      Height = 16
      Caption = #1050#1056#1045#1044#1048#1058
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdKrSt: TcxButtonEdit
      Left = 304
      Top = 181
      Width = 218
      Height = 24
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Properties.OnButtonClick = EdKrStPropertiesButtonClick
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 0
    end
    object EdDbSt: TcxButtonEdit
      Left = 40
      Top = 182
      Width = 218
      Height = 24
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Properties.OnButtonClick = EdDbStPropertiesButtonClick
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 1
    end
    object EdDbRazdel: TcxButtonEdit
      Left = 40
      Top = 110
      Width = 218
      Height = 24
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Properties.OnButtonClick = EdDbRazdelPropertiesButtonClick
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 2
    end
    object EdDbBudget: TcxButtonEdit
      Left = 40
      Top = 43
      Width = 218
      Height = 24
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Properties.OnButtonClick = EdDbBudgetPropertiesButtonClick
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 3
    end
    object EdKrBudget: TcxButtonEdit
      Left = 304
      Top = 43
      Width = 218
      Height = 24
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Properties.OnButtonClick = EdKrBudgetPropertiesButtonClick
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 4
    end
    object EdKrRazdel: TcxButtonEdit
      Left = 304
      Top = 110
      Width = 218
      Height = 24
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Properties.OnButtonClick = EdKrRazdelPropertiesButtonClick
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 5
    end
    object EdDbBudgetTitle: TcxTextEdit
      Left = 40
      Top = 65
      Width = 218
      Height = 24
      TabStop = False
      ParentFont = False
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Style.Color = cl3DLight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 6
    end
    object EdDbRazdelTitle: TcxTextEdit
      Left = 40
      Top = 132
      Width = 218
      Height = 24
      TabStop = False
      ParentFont = False
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Style.Color = cl3DLight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 7
    end
    object EdDbStTitle: TcxTextEdit
      Left = 40
      Top = 204
      Width = 218
      Height = 24
      TabStop = False
      ParentFont = False
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Style.Color = cl3DLight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 8
    end
    object EdKrRazdelTitle: TcxTextEdit
      Left = 304
      Top = 132
      Width = 218
      Height = 24
      TabStop = False
      ParentFont = False
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Style.Color = cl3DLight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 9
    end
    object EdKrStTitle: TcxTextEdit
      Left = 304
      Top = 203
      Width = 218
      Height = 24
      TabStop = False
      ParentFont = False
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Style.Color = cl3DLight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 10
    end
    object EdKrBudgetTitle: TcxTextEdit
      Left = 304
      Top = 65
      Width = 218
      Height = 24
      TabStop = False
      ParentFont = False
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Style.Color = cl3DLight
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 11
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 248
    Width = 565
    Height = 41
    Align = alBottom
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 392
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 472
      Top = 8
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1080#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = cxButton2Click
    end
  end
end
