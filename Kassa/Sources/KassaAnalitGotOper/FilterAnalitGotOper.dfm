object fmFilterAnalitGotOper: TfmFilterAnalitGotOper
  Left = 265
  Top = 209
  BorderStyle = bsDialog
  Caption = 'fmFilterAnalitGotOper'
  ClientHeight = 270
  ClientWidth = 450
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    450
    270)
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 25
    Width = 432
    Height = 64
    Alignment = alTopLeft
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    object cxDateEdit1: TcxDateEdit
      Left = 131
      Top = 36
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 4
    end
    object cxDateEdit2: TcxDateEdit
      Left = 299
      Top = 36
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 5
    end
    object cxLabel2: TcxLabel
      Left = 259
      Top = 38
      Width = 38
      Height = 17
      AutoSize = False
      TabOrder = 6
    end
    object cxRadioButton4: TcxRadioButton
      Left = 11
      Top = 14
      Width = 150
      Height = 17
      Caption = 'cxRadioButton4'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = cxRadioButton4Click
    end
    object cxRadioButton5: TcxRadioButton
      Left = 11
      Top = 38
      Width = 118
      Height = 17
      Caption = 'cxRadioButton5'
      TabOrder = 3
      OnClick = cxRadioButton5Click
    end
    object cxComboBox1: TcxComboBox
      Left = 168
      Top = 12
      Width = 169
      Height = 21
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownRows = 12
      TabOrder = 1
    end
    object cxSpinEdit1: TcxSpinEdit
      Left = 348
      Top = 11
      Width = 65
      Height = 21
      TabOrder = 2
      OnClick = cxSpinEdit1Click
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 40
    Top = 155
    Width = 400
    Height = 77
    Alignment = alTopLeft
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    object cxRadioButton1: TcxRadioButton
      Left = 8
      Top = 8
      Width = 113
      Height = 17
      Caption = 'cxRadioButton1'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object cxRadioButton2: TcxRadioButton
      Left = 8
      Top = 32
      Width = 113
      Height = 17
      Caption = 'cxRadioButton2'
      TabOrder = 1
    end
    object cxRadioButton3: TcxRadioButton
      Left = 8
      Top = 56
      Width = 113
      Height = 17
      Caption = 'cxRadioButton3'
      TabOrder = 2
    end
  end
  object cxButton1: TcxButton
    Left = 64
    Top = 240
    Width = 193
    Height = 25
    Caption = 'cxButton1'
    Default = True
    TabOrder = 4
    OnClick = cxButton1Click
    Glyph.Data = {
      82010000424D8201000000000000820000002800000010000000100000000100
      08000000000000010000C30E0000C30E0000130000001300000000000000FFFF
      FF00A5636B00A5736B00BD846B00BD7B5A00D6946B00C8D0D400CECED600EFEF
      EF00C6C6C600BDBDBD00ADADAD009C9C9C008C8C8C0084848400737373005A5A
      5A00424242000707070707070707070707070707070707070707070707070202
      07070707070707070707070707020F0207070707070707070707070702080F02
      07070707070707070707070702090F0207070707070707070707070702090F02
      07070707070707070707070703090F0207070707070707070707070704090F02
      07070707070707070707070706090F0207070707070707070707070509080F12
      020707070707070707070509080B0E111202070707070707070509090A0C0E10
      1112020707070707050909080B0D0F0F10111202070707050909080A0A0F0F0F
      0F10111202070606060606060606060606060606060607070707070707070707
      070707070707}
    UseSystemPaint = False
  end
  object cxButton2: TcxButton
    Left = 268
    Top = 240
    Width = 171
    Height = 25
    Cancel = True
    Caption = 'cxButton2'
    TabOrder = 5
    OnClick = cxButton2Click
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
  object cxLabel4: TcxLabel
    Left = 7
    Top = 6
    Width = 281
    Height = 17
    TabStop = False
    AutoSize = False
    TabOrder = 6
  end
  object cxComboBoxSch: TcxComboBox
    Left = 288
    Top = 5
    Width = 129
    Height = 21
    TabOrder = 0
  end
  object cxGroupBox3: TcxGroupBox
    Left = 8
    Top = 88
    Width = 433
    Height = 65
    Alignment = alTopLeft
    TabOrder = 2
    object cxButtonEdit3: TcxButtonEdit
      Left = 123
      Top = 11
      Width = 297
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit3PropertiesButtonClick
      Style.Color = clWindow
      TabOrder = 0
    end
    object cxButtonEdit2: TcxButtonEdit
      Left = 123
      Top = 37
      Width = 297
      Height = 21
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit2PropertiesButtonClick
      Style.Color = clWindow
      TabOrder = 1
    end
    object cxLabel1: TcxLabel
      Left = 9
      Top = 12
      Width = 112
      Height = 18
      AutoSize = False
      TabOrder = 2
    end
    object cxLabel3: TcxLabel
      Left = 9
      Top = 38
      Width = 112
      Height = 18
      AutoSize = False
      TabOrder = 3
    end
  end
  object Database: TpFIBDatabase
    DefaultTransaction = Transaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 248
    Top = 184
  end
  object DataSetSch: TpFIBDataSet
    Left = 288
    Top = 184
    poSQLINT64ToBCD = True
  end
  object Transaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 328
    Top = 184
  end
end
