object frmST_PROP: TfrmST_PROP
  Left = 423
  Top = 293
  Width = 202
  Height = 168
  Caption = 'frmST_PROP'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxButtonOK: TcxButton
    Left = 96
    Top = 48
    Width = 75
    Height = 25
    Caption = 'cxButtonOK'
    TabOrder = 0
    OnClick = cxButtonOKClick
  end
  object frxReport: TfrxReport
    Version = '3.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38547.971870833330000000
    ReportOptions.LastChange = 38547.971870833330000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Datasets = <>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 22.677180000000000000
        Top = 18.897650000000000000
      end
      object MasterData1: TfrxMasterData
        Height = 22.677180000000000000
        Top = 83.149660000000000000
        RowCount = 0
      end
      object PageFooter1: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 147.401670000000000000
        object Memo1: TfrxMemoView
          Left = 642.419312533333400000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.Strings = (
            '[Page#]')
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = pFIBDataSet
    Left = 32
  end
  object pFIBDataSet: TpFIBDataSet
    Left = 64
    poSQLINT64ToBCD = True
  end
  object pFIBStoredProc: TpFIBStoredProc
    Left = 96
  end
  object frxDesigner1: TfrxDesigner
    Restrictions = []
    Top = 32
  end
end
