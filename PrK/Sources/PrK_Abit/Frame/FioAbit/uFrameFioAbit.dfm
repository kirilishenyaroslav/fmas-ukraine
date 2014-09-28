object FrameFioAbit: TFrameFioAbit
  Left = 0
  Top = 0
  Width = 398
  Height = 285
  TabOrder = 0
  object cxLabelFioAbit: TcxLabel
    Left = 16
    Top = 37
    Width = 209
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
  object cxButtonEditFioAbit: TcxButtonEdit
    Left = 16
    Top = 64
    Width = 337
    Height = 21
    ParentFont = False
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = cxButtonEditFioAbitPropertiesButtonClick
    TabOrder = 1
    Text = 'cxButtonEditFioAbit'
    OnKeyPress = cxButtonEditFioAbitKeyPress
  end
end
