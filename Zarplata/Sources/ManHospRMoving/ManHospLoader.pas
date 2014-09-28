unit ManHospLoader;

interface

uses Classes, IBase, MainManHospRMoving, ZProc, ZTypes,dxBar,
     Controls, Forms;

function ViewHospRMoving(AOwner : TComponent;DB:TISC_DB_HANDLE;PZFormStyle:TZFormStyle):Variant;stdcall;
exports ViewHospRMoving;

implementation


function ViewHospRMoving(AOwner : TComponent;DB:TISC_DB_HANDLE;PZFormStyle:TZFormStyle):Variant;
var ViewForm: TfmMainManHospRMoving;
begin
    if IsMDIChildFormShow(TfmMainManHospRMoving) then Exit;
       ViewForm  :=  TfmMainManHospRMoving.Create(AOwner, DB);

     case PZFormStyle of zfsNormal:
     begin
        ViewForm.FormStyle := fsNormal;
        ViewForm.SelBtn.Visible := ivAlways;
        ViewForm.Visible := false;
        ViewForm.ShowModal;
     end;
      zfsChild	          :
      begin
           ViewForm.FormStyle := fsMDIChild;
           ViewForm.Show;
      end;
     else
      begin
       ViewForm.ShowModal;
       ViewForm.free;
      end;
     end;

     Result:=ViewForm.Pres;
end;


end.

