{
  Clever Internet Suite Version 6.2
  Copyright (C) 1999 - 2006 Clever Components
  www.CleverComponents.com
}

unit clBodyChooser;

interface

{$I clVer.inc}
                              
uses
  Forms, Classes, Controls, StdCtrls, clMailMessage;

type
  TclMessageBodyChooser = class(TForm)
    btnOK: TButton;
    btnCancel: TButton;
    ComboBox: TComboBox;
    lkpType: TLabel;
  public
    class function AddSingleBody(AMessageBodies: TclMessageBodies): Boolean;
  end;

implementation

{$R *.DFM}

{ TclMessageBodyChooser }

type
  TclMessageBodiesAccess = class(TclMessageBodies);

class function TclMessageBodyChooser.AddSingleBody(AMessageBodies: TclMessageBodies): Boolean;
var
  i: Integer;
  Dlg: TclMessageBodyChooser;
begin
  Dlg := TclMessageBodyChooser.Create(nil);
  try
    Dlg.Caption := 'Select Body Type';
    for i := 0 to GetRegisteredBodyItems().Count - 1 do
    begin
      Dlg.ComboBox.Items.Add(TclMessageBodyClass(GetRegisteredBodyItems()[i]).ClassName);
    end;
    Dlg.ComboBox.ItemIndex := 0;
    Result := (Dlg.ShowModal() = mrOK);
    if Result then
    begin
      TclMessageBodiesAccess(AMessageBodies).AddItem(
        TclMessageBodyClass(GetRegisteredBodyItems()[Dlg.ComboBox.ItemIndex]));
    end;
  finally
    Dlg.Free();
  end;
end;

end.
