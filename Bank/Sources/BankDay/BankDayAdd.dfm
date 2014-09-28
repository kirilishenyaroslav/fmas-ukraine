object fmBankDayAdd: TfmBankDayAdd
  Left = 457
  Top = 304
  BorderStyle = bsDialog
  Caption = 'fmBankDayAdd'
  ClientHeight = 400
  ClientWidth = 339
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxButtonAdd: TcxButton
    Left = 68
    Top = 365
    Width = 99
    Height = 25
    Caption = 'cxButtonAdd'
    Default = True
    TabOrder = 2
    OnClick = cxButtonAddClick
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
  object cxButtonClose: TcxButton
    Left = 180
    Top = 365
    Width = 97
    Height = 25
    Cancel = True
    Caption = 'cxButtonClose'
    TabOrder = 3
    OnClick = cxButtonCloseClick
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FF824B4B4E1E1FFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B824B4BA64B4BA9
      4D4D4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      824B4B824B4BB64F50C24F50C54D4EB24D4E4E1E1F824B4B824B4B824B4B824B
      4B824B4B824B4BFF00FFFF00FFFF00FF824B4BD45859CB5556C95455C95253B7
      4F524E1E1FFE8B8CFB9A9CF8AAABF7B5B6F7B5B6824B4BFF00FFFF00FFFF00FF
      824B4BD75C5DD05A5BCF595ACF5758BD53564E1E1F23B54A13C14816BD480CBC
      41F7B5B6824B4BFF00FFFF00FFFF00FF824B4BDD6364D75F60D55E5FD55C5DC2
      575A4E1E1F2AB44D1CBF4C1EBC4C13BC45F7B5B6824B4BFF00FFFF00FFFF00FF
      824B4BE36869DD6566DA6364DE6667C6595B4E1E1F26B14916BC481BBB4910BB
      43F7B5B6824B4BFF00FFFF00FFFF00FF824B4BEB6D6EE26768E67E7FFAD3D4CC
      6E704E1E1FA5D89750D16F42C9662DC758F7B5B6824B4BFF00FFFF00FFFF00FF
      824B4BF27374E96C6DEB8182FCD1D3CF6E704E1E1FFFF2CCFFFFD7FFFFD4E6FC
      C7F7B5B6824B4BFF00FFFF00FFFF00FF824B4BF87879F07576EE7273F07374D1
      65664E1E1FFCEFC7FFFFD5FFFFD3FFFFD7F7B5B6824B4BFF00FFFF00FFFF00FF
      824B4BFE7F80F77A7BF6797AF77779D76B6B4E1E1FFCEFC7FFFFD5FFFFD3FFFF
      D5F7B5B6824B4BFF00FFFF00FFFF00FF824B4BFF8384FC7F80FB7E7FFE7F80DA
      6E6F4E1E1FFCEFC7FFFFD5FFFFD3FFFFD5F7B5B6824B4BFF00FFFF00FFFF00FF
      824B4BFF8889FF8283FF8182FF8283E073744E1E1FFCEFC7FFFFD5FFFFD3FFFF
      D5F7B5B6824B4BFF00FFFF00FFFF00FF824B4B824B4BE27576FE8182FF8687E5
      76774E1E1FFAEBC5FCFBD1FCFBCFFCFBD1F7B5B6824B4BFF00FFFF00FFFF00FF
      FF00FFFF00FF824B4B9C5657CB6C6DCF6E6E4E1E1F824B4B824B4B824B4B824B
      4B824B4B824B4BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF824B4B82
      4B4B4E1E1FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    UseSystemPaint = False
  end
  object cxTextEditSaldoBegin: TcxTextEdit
    Left = 4
    Top = 68
    Width = 121
    Height = 21
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = 15397837
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    TabOrder = 1
    Text = '0,00'
    OnExit = cxTextEditSaldoBeginExit
    OnKeyPress = cxTextEditSaldoBeginKeyPress
  end
  object cxTextEditSaldoEnd: TcxTextEdit
    Left = 156
    Top = 68
    Width = 121
    Height = 21
    TabStop = False
    Enabled = False
    TabOrder = 4
    Text = '0,00'
  end
  object cxTextEditSumDeb: TcxTextEdit
    Left = 4
    Top = 148
    Width = 121
    Height = 21
    TabStop = False
    Enabled = False
    TabOrder = 5
    Text = '0,00'
  end
  object cxTextEditsumKred: TcxTextEdit
    Left = 156
    Top = 148
    Width = 121
    Height = 21
    TabStop = False
    Enabled = False
    TabOrder = 6
    Text = '0,00'
  end
  object cxDateEditday: TcxDateEdit
    Left = 4
    Top = 20
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object cxLabel1: TcxLabel
    Left = 4
    Top = 0
    Width = 51
    Height = 17
    TabOrder = 7
  end
  object cxLabel2: TcxLabel
    Left = 4
    Top = 51
    Width = 137
    Height = 17
    AutoSize = False
    TabOrder = 8
  end
  object cxLabel3: TcxLabel
    Left = 156
    Top = 51
    Width = 129
    Height = 17
    AutoSize = False
    TabOrder = 9
  end
  object cxLabel4: TcxLabel
    Left = 4
    Top = 131
    Width = 127
    Height = 17
    AutoSize = False
    TabOrder = 10
  end
  object cxLabel5: TcxLabel
    Left = 156
    Top = 131
    Width = 128
    Height = 17
    AutoSize = False
    TabOrder = 11
  end
  object cxComboBox1: TcxComboBox
    Left = 4
    Top = 228
    Width = 49
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownRows = 11
    Properties.Items.Strings = (
      '0'
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10'
      '11'
      '12'
      '13'
      '14'
      '15'
      '16'
      '17'
      '18'
      '19'
      '20')
    TabOrder = 12
  end
  object cxLabel6: TcxLabel
    Left = 53
    Top = 228
    Width = 264
    Height = 17
    AutoSize = False
    TabOrder = 13
  end
  object cxLabel7: TcxLabel
    Left = 53
    Top = 260
    Width = 263
    Height = 17
    AutoSize = False
    TabOrder = 14
  end
  object cxComboBox2: TcxComboBox
    Left = 4
    Top = 260
    Width = 49
    Height = 21
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownRows = 11
    Properties.Items.Strings = (
      '0'
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10'
      '11'
      '12'
      '13'
      '14'
      '15'
      '16'
      '17'
      '18'
      '19'
      '20')
    TabOrder = 15
  end
  object cxCheckBoxBlokDebet: TcxCheckBox
    Left = 4
    Top = 292
    Width = 293
    Height = 21
    AutoSize = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1047#1072#1073#1083#1086#1082#1091#1074#1072#1090#1080' '#1076#1077#1073#1077#1090
    TabOrder = 16
  end
  object cxCheckBoxBlokKredit: TcxCheckBox
    Left = 4
    Top = 312
    Width = 293
    Height = 21
    AutoSize = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1047#1072#1073#1083#1086#1082#1091#1074#1072#1090#1080' '#1082#1088#1077#1076#1080#1090
    TabOrder = 17
  end
  object cxCheckBoxdayBlokSaldo: TcxCheckBox
    Left = 4
    Top = 333
    Width = 293
    Height = 21
    AutoSize = False
    Properties.DisplayUnchecked = 'False'
    Properties.Caption = #1047#1072#1073#1083#1086#1082#1091#1074#1072#1090#1080' '#1082#1110#1085#1094#1077#1074#1077' '#1089#1072#1083#1100#1076#1086
    TabOrder = 18
  end
  object cxTextEditSaldoBeginValuta: TcxTextEdit
    Left = 4
    Top = 108
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 19
    Text = 'cxTextEditSaldoBeginValuta'
  end
  object cxTextEditSaldoEndValuta: TcxTextEdit
    Left = 156
    Top = 108
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 20
    Text = 'cxTextEditSaldoEndValuta'
  end
  object cxTextEditSumDebValuta: TcxTextEdit
    Left = 4
    Top = 188
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 21
    Text = '0,00'
  end
  object cxTextEditsumKredValuta: TcxTextEdit
    Left = 156
    Top = 188
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 22
    Text = '0,00'
  end
  object cxLabel8: TcxLabel
    Left = 4
    Top = 170
    Width = 140
    Height = 17
    TabOrder = 23
    Caption = #1089#1091#1084#1072' '#1079#1072' '#1076#1077#1073#1077#1090#1086#1084' ('#1074#1072#1083#1102#1090#1072')'
  end
  object cxLabel9: TcxLabel
    Left = 156
    Top = 170
    Width = 147
    Height = 17
    TabOrder = 24
    Caption = #1057#1091#1084#1072' '#1079#1072' '#1082#1088#1077#1076#1080#1090#1086#1084' ('#1074#1072#1083#1102#1090#1072')'
  end
  object cxLabel10: TcxLabel
    Left = 4
    Top = 90
    Width = 147
    Height = 17
    TabOrder = 25
    Caption = #1055#1086#1095#1072#1090#1082#1086#1074#1077' '#1089#1072#1083#1100#1076#1086' ('#1074#1072#1083#1102#1090#1072')'
  end
  object cxLabel11: TcxLabel
    Left = 156
    Top = 90
    Width = 132
    Height = 17
    TabOrder = 26
    Caption = #1050#1110#1085#1094#1077#1074#1077' '#1089#1072#1083#1100#1076#1086' ('#1074#1072#1083#1102#1090#1072')'
  end
  object cxLabel12: TcxLabel
    Left = 4
    Top = 208
    Width = 57
    Height = 17
    TabOrder = 27
    Caption = #1074#1072#1083#1102#1090#1072
  end
  object cxLabel13: TcxLabel
    Left = 48
    Top = 208
    Width = 249
    Height = 17
    AutoSize = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    TabOrder = 28
  end
  object ActionList1: TActionList
    Left = 288
    Top = 32
    object ActionClose: TAction
      Caption = 'ActionClose'
      ShortCut = 27
      OnExecute = ActionCloseExecute
    end
    object ActionAdd: TAction
      Caption = 'ActionAdd'
      ShortCut = 121
      OnExecute = ActionAddExecute
    end
  end
  object Class_DataSet: TpFIBDataSet
    Left = 240
    Top = 8
    poSQLINT64ToBCD = True
  end
  object Class_Database: TpFIBDatabase
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 136
    Top = 8
  end
  object Class_Transaction_Wr: TpFIBTransaction
    DefaultDatabase = Class_Database
    TimeoutAction = TARollback
    Left = 192
    Top = 8
  end
  object Class_StoredProc: TpFIBStoredProc
    Left = 304
    Top = 8
  end
  object DS_SALDO: TpFIBDataSet
    Left = 72
    Top = 184
    poSQLINT64ToBCD = True
  end
  object TR: TpFIBTransaction
    TimeoutAction = TARollback
    Left = 112
    Top = 184
  end
  object DataSetDays_ago: TpFIBDataSet
    Left = 160
    Top = 248
    poSQLINT64ToBCD = True
  end
end
