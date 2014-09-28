object DM: TDM
  OldCreateOrder = False
  Left = 972
  Top = 783
  Height = 201
  Width = 308
  object Database: TpFIBDatabase
    DBName = 'E:\Delphi\__LFMAS__\DataBase\DZRGNSK.IB'
    DBParams.Strings = (
      'lc_ctype=win1251'
      'password=masterkey'
      'user_name=SYSDBA')
    DefaultTransaction = ReadTransaction
    DefaultUpdateTransaction = WriteTransaction
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 16
    Top = 16
  end
  object ReadTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 112
    Top = 16
  end
  object WriteTransaction: TpFIBTransaction
    DefaultDatabase = Database
    TimeoutAction = TARollback
    Left = 208
    Top = 16
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 41
    Top = 105
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = 12937777
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMedGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clMaroon
      TextColor = clBlack
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor]
      Color = clBtnFace
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clSilver
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svBitmap, svColor, svTextColor]
      Color = 12937777
      Bitmap.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
        FF0084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
        C600C6C6C600C6C6C600C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00
        FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00
        FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00
        FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FF
        FF00FFFFFF00FFFFFF00C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00
        FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00
        FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00
        FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00
        FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00
        FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00
        FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00C6C6C60000000000FF00FF00FF00FF00FF00FF00FF00
        FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
        FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00C6C6C600FFFFFF0084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00C6C6C60084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00848484008484840084848400848484008484840084848400848484008484
        840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      TextColor = clWhite
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor]
      Color = 8453888
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16777088
      TextColor = clBlue
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object TreeListStyleSheetDevExpress: TcxTreeListStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle5
      Styles.Inactive = cxStyle9
      Styles.Selection = cxStyle13
      Styles.BandBackground = cxStyle2
      Styles.BandHeader = cxStyle3
      Styles.ColumnHeader = cxStyle4
      Styles.ContentEven = cxStyle6
      Styles.ContentOdd = cxStyle7
      Styles.Footer = cxStyle8
      Styles.IncSearch = cxStyle10
      Styles.Indicator = cxStyle11
      Styles.Preview = cxStyle12
      BuiltIn = True
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle5
      Styles.ContentEven = cxStyle6
      Styles.ContentOdd = cxStyle7
      Styles.Inactive = cxStyle9
      Styles.IncSearch = cxStyle10
      Styles.Selection = cxStyle13
      Styles.FilterBox = cxStyle4
      Styles.Footer = cxStyle8
      Styles.Group = cxStyle14
      Styles.GroupByBox = cxStyle4
      Styles.Header = cxStyle4
      Styles.Indicator = cxStyle11
      Styles.Preview = cxStyle12
      BuiltIn = True
    end
    object cxGridTableViewStyleSheet2: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle15
      Styles.Content = cxStyle16
      Styles.ContentEven = cxStyle17
      Styles.ContentOdd = cxStyle18
      Styles.Inactive = cxStyle24
      Styles.IncSearch = cxStyle25
      Styles.Selection = cxStyle28
      Styles.FilterBox = cxStyle19
      Styles.Footer = cxStyle20
      Styles.Group = cxStyle21
      Styles.GroupByBox = cxStyle22
      Styles.Header = cxStyle23
      Styles.Indicator = cxStyle26
      Styles.Preview = cxStyle27
      BuiltIn = True
    end
  end
  object cxEditStyleController1: TcxEditStyleController
    Style.Color = 16247513
    Style.LookAndFeel.NativeStyle = False
    Left = 153
    Top = 103
  end
  object StoredProc: TpFIBStoredProc
    Database = Database
    Transaction = WriteTransaction
    Left = 240
    Top = 104
  end
end
