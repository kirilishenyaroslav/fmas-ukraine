inherited VoenkomForm: TVoenkomForm
  Left = 245
  Top = 91
  Caption = #1044#1086#1074#1110#1076#1085#1080#1082' '#1074#1110#1081#1089#1082#1086#1084#1072#1090#1110#1074
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ResultGrid: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'VOENKOMAT'
        Title.Caption = #1042#1110#1081#1089#1082#1086#1084#1072#1090
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  inherited SearchEdit: TEdit
    Left = 56
    Top = 340
  end
  inherited ResultQuery: TIBQuery
    OnCalcFields = ResultQueryCalcFields
    SQL.Strings = (
      'SELECT DISTINCT  VOENKOMAT FROM MAN_WAR ORDER BY VOENKOMAT')
    object ResultQueryVOENKOMAT: TIBStringField [0]
      FieldName = 'VOENKOMAT'
      Origin = 'MAN_WAR.VOENKOMAT'
      Required = True
      Size = 100
    end
    inherited ResultQueryVIDAN: TIBStringField
      FieldKind = fkCalculated
      Origin = 'MAN_WAR.VOENKOMAT'
      Calculated = True
    end
  end
end
