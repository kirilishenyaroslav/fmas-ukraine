object FormAddShabloniProv: TFormAddShabloniProv
  Left = 429
  Top = 198
  Width = 569
  Height = 528
  Caption = 'FormAddShabloniProv'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabelKOD_DOG: TcxLabel
    Left = 16
    Top = 369
    Width = 153
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 0
  end
  object cxLabelSUMMA: TcxLabel
    Left = 16
    Top = 393
    Width = 161
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 1
  end
  object cxButtonEditKOD_DOG: TcxButtonEdit
    Left = 176
    Top = 369
    Width = 377
    Height = 21
    AutoSize = False
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEditKOD_DOGPropertiesButtonClick
    Style.Color = clInfoBk
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 2
  end
  object GroupBoxDannie_O_provodke: TGroupBox
    Left = 8
    Top = 152
    Width = 545
    Height = 209
    Caption = 'GroupBoxDannie_O_provodke'
    TabOrder = 3
    object cxLabelSMETA_TITLE: TcxLabel
      Left = 8
      Top = 14
      Width = 161
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
    object cxLabelNomerStatiy: TcxLabel
      Left = 8
      Top = 134
      Width = 161
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
    end
    object cxLabelKEKV_KOD: TcxLabel
      Left = 8
      Top = 183
      Width = 153
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
    object cxLabelKEKV_TITLE: TcxLabel
      Left = 8
      Top = 158
      Width = 153
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
    object cxButtonEditSMETA_TITLE: TcxButtonEdit
      Left = 168
      Top = 14
      Width = 369
      Height = 21
      AutoSize = False
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEditSMETA_TITLEPropertiesButtonClick
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
    end
    object cxButtonEditKEKV_TITLE: TcxButtonEdit
      Left = 168
      Top = 158
      Width = 369
      Height = 22
      AutoSize = False
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEditKEKV_TITLEPropertiesButtonClick
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
    end
    object cxLabelSmetaKod: TcxLabel
      Left = 8
      Top = 38
      Width = 153
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
    object cxLabelNomer_Razdela: TcxLabel
      Left = 8
      Top = 86
      Width = 153
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
    object cxTextEditSmetaKod: TcxTextEdit
      Left = 168
      Top = 38
      Width = 169
      Height = 21
      AutoSize = False
      ParentFont = False
      Properties.ReadOnly = True
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 8
    end
    object cxLabelNameRazdela: TcxLabel
      Left = 8
      Top = 62
      Width = 153
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 9
    end
    object cxTextEditNomer_Razdela: TcxTextEdit
      Left = 168
      Top = 86
      Width = 169
      Height = 21
      AutoSize = False
      ParentFont = False
      Properties.ReadOnly = True
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 10
    end
    object cxLabelNameStatii: TcxLabel
      Left = 8
      Top = 110
      Width = 161
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 11
    end
    object cxButtonEditNameStatii: TcxButtonEdit
      Left = 168
      Top = 110
      Width = 369
      Height = 21
      AutoSize = False
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEditNameStatiiPropertiesButtonClick
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 12
    end
    object cxTextEditNomerStatiy: TcxTextEdit
      Left = 168
      Top = 134
      Width = 169
      Height = 21
      AutoSize = False
      ParentFont = False
      Properties.ReadOnly = True
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 13
    end
    object cxButtonEditNameRazdela: TcxButtonEdit
      Left = 168
      Top = 62
      Width = 369
      Height = 21
      AutoSize = False
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEditNameRazdelaPropertiesButtonClick
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 14
    end
    object cxTextEditKEKV_KOD: TcxTextEdit
      Left = 168
      Top = 184
      Width = 169
      Height = 21
      AutoSize = False
      ParentFont = False
      Properties.ReadOnly = True
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 15
    end
  end
  object GroupBoxLichDannie: TGroupBox
    Left = 8
    Top = 8
    Width = 545
    Height = 137
    Caption = 'GroupBoxLichDannie'
    TabOrder = 4
    object cxButtonEditFIO: TcxButtonEdit
      Left = 168
      Top = 56
      Width = 369
      Height = 21
      AutoSize = False
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEditFIOPropertiesButtonClick
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 0
    end
    object cxLabelFio: TcxLabel
      Left = 8
      Top = 56
      Width = 153
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 1
    end
    object cxTextEditName_Shablona: TcxTextEdit
      Left = 168
      Top = 10
      Width = 369
      Height = 21
      AutoSize = False
      ParentFont = False
      Properties.ReadOnly = False
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 2
    end
    object cxLabelName_Shablona: TcxLabel
      Left = 8
      Top = 12
      Width = 153
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
    object cxLabelKod_Shablona: TcxLabel
      Left = 8
      Top = 32
      Width = 153
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 4
    end
    object cxTextEditKod_Shablona: TcxTextEdit
      Left = 168
      Top = 32
      Width = 177
      Height = 21
      AutoSize = False
      ParentFont = False
      Properties.ReadOnly = False
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 5
      OnKeyPress = cxTextEditKod_ShablonaKeyPress
    end
    object cxLabelSCH_NUMBER: TcxLabel
      Left = 8
      Top = 104
      Width = 153
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
    object cxTextEditSCH_NUMBER: TcxTextEdit
      Left = 168
      Top = 102
      Width = 177
      Height = 21
      AutoSize = False
      ParentFont = False
      Properties.ReadOnly = True
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 7
    end
    object cxLabelSCH_TITLE: TcxLabel
      Left = 8
      Top = 80
      Width = 153
      Height = 17
      AutoSize = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 8
    end
    object cxButtonEditSCH_TITLE: TcxButtonEdit
      Left = 168
      Top = 79
      Width = 369
      Height = 21
      AutoSize = False
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEditSCH_TITLEPropertiesButtonClick
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      TabOrder = 9
    end
  end
  object cxButtonAdd: TcxButton
    Left = 320
    Top = 464
    Width = 113
    Height = 25
    Cursor = crHandPoint
    Action = ActionAdd
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Glyph.Data = {
      AE010000424DAE01000000000000AE000000280000000F000000100000000100
      08000000000000010000C30E0000C30E00001E0000001E00000000000000FFFF
      FF008C5A5A009C6B6B00BD848400B58C8C00BDADAD00D6C6C600EFDEDE009C6B
      6300A57B7300C68C7B00F7DECE00FFE7D600F7DEC600EFDECE00FFF7EF00F7E7
      D600FFD6A500EFB56B00F7DEBD00F7E7CE00FFF7E700F7EFDE00FFFFF7004C80
      4C0052AE570069CA8000C8D0D400FFFFFF001C1C1C1C05020202020202020202
      1C001C1C1C1C051617171717171715021C001C1C1C1C05170C0E0E0E0E0F0F02
      1C001C1C1C1C05161212121212120F021C000502020205100E0E0E0E14150F09
      1C00051617170510150E0E0E0E110F031C0005170C0E0518121212191919190A
      1C000516121205180D0D11191A1A190A1C0005100E0E0501011919191A1A1919
      19000510150E050101191A1A1A1A1A1A190005181212050101191B1B1B1A1A1A
      190005180D0D0505051919191B1A19191900050101011818080706191B1A191C
      1C00050101011818050505191919191C1C0005010101010105130B1C1C1C1C1C
      1C0005050505050505041C1C1C1C1C1C1C00}
    UseSystemPaint = False
  end
  object cxButtonOtmena: TcxButton
    Left = 440
    Top = 464
    Width = 105
    Height = 25
    Cursor = crHandPoint
    Action = ActionExit
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    Glyph.Data = {
      32040000424D3204000000000000360000002800000014000000110000000100
      180000000000FC030000120B0000120B00000000000000000000C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4B54A009C31009C3100C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4B54A00FFEFA5FFEFA55A31185A3118C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4B54A00FFEFA5FFEFA5FFE78CFFE78C313131313131C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
      FF6331B54A00FFEFA5FFEFA5FFE78CFFE78CFFCE63FFC65A3131319C31009C31
      00C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF31FFFF6331B5
      4A00FFEFA5FFEFA5FFE78CFFE78CFFCE63FFC65AFF9C00FF9C639C3100C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331B54A00FFEF
      A5FFEFA5000000080808FFCE63FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4080808C8D0D4C8D0D4FF6331B54A00FFEFA5FFEFA5
      FFDE84FFDE84FFCE63FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4000000000000C8D0D4C8D0D4FF6331B54A00F7FFFFFFDE84FFDE84FF
      DE84FFDE84FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4C8D0D4000000
      FFFFCE000000000000000000000000B54A00F7FFFFFFEFA5FFDE84FFDE84FFDE
      84FFC65AFF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4000000FFFFCEFFFFCEFF
      FFBDFFC65AFFA510FF9C00B54A00F7FFFFFFEFA5FFDE84FFDE84FFCE63FFC65A
      FF9C00FF9C639C3100C8D0D4C8D0D4C8D0D4C8D0D4000000FFFFCE0000000000
      00000000080808B54A00F7FFFFFFFFFFFFDE84FFDE84FFCE63FFC65AFF9C00FF
      9C639C3100C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4080808000000C8D0D4C8D0D4
      FF6331B54A00F7FFFFFFFFFFFFDE84FFDE84FFCE63FFC65AFF9C00FF9C639C31
      00C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000C8D0D4FF31FFFF6331C6
      5A00C65A00FFFFFFFFDE84FFDE84FFCE63FFC65AFF9C00FF9C009C3100C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331FFD673FFD6
      73C65A00C65A00CE6363FFCE63FFC65AFF9C00FF9C009C3100C8D0D4C8D0D4C8
      D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331FFD673FFD673FFD673
      FFD673C65A00C65A00CE6363FF9C00FF9C009C3100C8D0D4C8D0D4C8D0D4C8D0
      D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4FF6331FFDE84FFDE84FFDE84FFDE84FF
      DE84FFDE84C65A00C65A00C65A009C3100C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
      C8D0D4C8D0D4C8D0D4C8D0D4FF6331FF6331FF6331FF6331FF6331FF6331FF63
      31FF6331FF6331FF6331FF6331C8D0D4C8D0D4C8D0D4}
    UseSystemPaint = False
  end
  object GroupBoxVisible: TGroupBox
    Left = 8
    Top = 417
    Width = 545
    Height = 40
    Caption = 'GroupBoxVisible'
    TabOrder = 7
    object CheckBoxVisibleKassa: TCheckBox
      Left = 8
      Top = 18
      Width = 168
      Height = 17
      Cursor = crHandPoint
      Caption = 'CheckBoxVisibleKassa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object CheckBoxVisibleBank: TCheckBox
      Left = 182
      Top = 18
      Width = 183
      Height = 17
      Cursor = crHandPoint
      Caption = 'CheckBoxVisibleBank'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object CheckBoxVisibleAvance: TCheckBox
      Left = 368
      Top = 18
      Width = 174
      Height = 17
      Cursor = crHandPoint
      Caption = 'CheckBoxVisibleAvance'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
  end
  object cxTextEditSUMMA: TcxTextEdit
    Left = 176
    Top = 393
    Width = 177
    Height = 21
    AutoSize = False
    ParentFont = False
    Style.Color = clInfoBk
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 8
    OnKeyPress = cxTextEditSUMMAKeyPress
  end
  object ActionList1: TActionList
    Images = Form_Shabloni_Prov.ImageList
    Left = 472
    Top = 112
    object ActionAdd: TAction
      Caption = 'ActionAdd'
      ImageIndex = 1
      ShortCut = 121
      OnExecute = ActionAddExecute
    end
    object ActionExit: TAction
      Caption = 'ActionExit'
      ImageIndex = 5
      ShortCut = 27
      OnExecute = ActionExitExecute
    end
    object ActionClear: TAction
      Caption = 'ActionClear'
      ImageIndex = 5
    end
  end
end
