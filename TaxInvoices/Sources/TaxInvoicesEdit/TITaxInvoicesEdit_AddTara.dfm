object TaxInvoicesEditAddTaraForm: TTaxInvoicesEditAddTaraForm
  Left = 392
  Top = 461
  Width = 575
  Height = 176
  Caption = #1044#1086#1076#1072#1090#1080' '#1090#1086#1074#1072#1088' '#1091' '#1085#1072#1082#1083#1072#1076#1085#1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 559
    Height = 138
    Align = alClient
    TabOrder = 0
    object TaraGroupBox: TGroupBox
      Left = 1
      Top = 1
      Width = 557
      Height = 96
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object TaraLabel: TLabel
        Left = 33
        Top = 21
        Width = 109
        Height = 16
        Caption = #1085#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SummaLabel: TLabel
        Left = 33
        Top = 48
        Width = 170
        Height = 32
        Caption = #1079#1072#1075#1072#1083#1100#1085#1072' '#1089#1091#1084#1072' '#1082#1086#1096#1090#1110#1074', '#13#10#1097#1086' '#1087#1110#1076#1083#1103#1075#1072#1108' '#1086#1087#1083#1072#1090#1110
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SummaCurrencyEdit: TcxCurrencyEdit
        Left = 208
        Top = 56
        Width = 225
        Height = 24
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = ',0.00'#39#39';-,0.00'#39#39
        TabOrder = 0
      end
      object TaraButtonEdit: TcxButtonEdit
        Left = 208
        Top = 22
        Width = 289
        Height = 24
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
        TabOrder = 1
      end
    end
    object YesButton: TcxButton
      Left = 360
      Top = 104
      Width = 75
      Height = 25
      Caption = #1054#1050
      Default = True
      TabOrder = 1
      OnClick = YesButtonClick
    end
    object CancelButton: TcxButton
      Left = 440
      Top = 104
      Width = 75
      Height = 25
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 2
      OnClick = CancelButtonClick
    end
  end
end
