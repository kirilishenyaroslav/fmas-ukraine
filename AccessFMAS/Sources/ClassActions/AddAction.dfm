object FormAddAction: TFormAddAction
  Left = 292
  Top = 362
  BorderStyle = bsDialog
  Caption = 'Добавление действия'
  ClientHeight = 101
  ClientWidth = 517
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LabelAdd: TLabel
    Left = 4
    Top = 10
    Width = 50
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'Название'
  end
  object LabelFullName: TLabel
    Left = 4
    Top = 42
    Width = 89
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'Полное название'
  end
  object EditName: TEdit
    Left = 100
    Top = 6
    Width = 410
    Height = 21
    Anchors = [akRight, akBottom]
    TabOrder = 0
  end
  object EditFullName: TEdit
    Left = 100
    Top = 38
    Width = 409
    Height = 21
    Anchors = [akRight, akBottom]
    TabOrder = 1
  end
  object ButtonOk: TButton
    Left = 355
    Top = 70
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Добавить'
    ModalResult = 1
    TabOrder = 2
    OnClick = ButtonOkClick
  end
  object ButtonCancel: TButton
    Left = 435
    Top = 70
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Отмена'
    TabOrder = 3
    OnClick = ButtonCancelClick
  end
  object IBStoredProcIns: TIBStoredProc
    Database = DMMain.KruAccessDB
    Transaction = IBTransaction
    StoredProcName = 'INSERT_ACTION'
    Params = <
      item
        DataType = ftInteger
        Name = 'PID_ACTION'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'PNAME_ACTION'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PFULL_NAME_ACTION'
        ParamType = ptInput
      end>
    Left = 264
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PID_ACTION'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'PNAME_ACTION'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PFULL_NAME_ACTION'
        ParamType = ptInput
      end>
  end
  object IBTransaction: TIBTransaction
    Active = True
    DefaultDatabase = DMMain.KruAccessDB
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 232
    Top = 72
  end
  object IBStoredProcUpd: TIBStoredProc
    Database = DMMain.KruAccessDB
    Transaction = IBTransaction
    StoredProcName = 'UPDATE_ACTION'
    Params = <
      item
        DataType = ftInteger
        Name = 'PID_ACTION'
        ParamType = ptInput
        Value = 'Null'
      end
      item
        DataType = ftString
        Name = 'PNAME_ACTION'
        ParamType = ptInput
        Value = 'Null'
      end
      item
        DataType = ftString
        Name = 'PFULL_NAME_ACTION'
        ParamType = ptInput
        Value = 'Null'
      end>
    Left = 296
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PID_ACTION'
        ParamType = ptInput
        Value = 'Null'
      end
      item
        DataType = ftString
        Name = 'PNAME_ACTION'
        ParamType = ptInput
        Value = 'Null'
      end
      item
        DataType = ftString
        Name = 'PFULL_NAME_ACTION'
        ParamType = ptInput
        Value = 'Null'
      end>
  end
end
