object GlobalActions: TGlobalActions
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 696
  Top = 414
  Height = 146
  Width = 217
  object Actions: TActionList
    Left = 16
    Top = 8
    object TableSigners: TAction
      OnExecute = TableSignersExecute
    end
  end
end
