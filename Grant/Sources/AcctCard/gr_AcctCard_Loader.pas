unit gr_AcctCard_Loader;

interface

Uses Classes, IBase, Variants, gr_AcctCard_MainForm, gr_uCommonLoader, Controls;

function View_FgrAcctCardCtrl(AParameter:TObject):Variant; stdcall;
 exports View_FgrAcctCardCtrl;

implementation

function View_FgrAcctCardCtrl(AParameter:TObject):Variant; stdcall;
var ViewForm:TFTnAccessControl;
begin
ViewForm := TFTnAccessControl.Create(AParameter as TgrCtrlSimpleParam);
ViewForm.ShowModal;
ViewForm.Destroy;
end;


end.
