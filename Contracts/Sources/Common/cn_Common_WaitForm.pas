unit cn_Common_WaitForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo, ExtCtrls,
  cnConsts_Messages, cn_Common_Funcs, ComCtrls;

type TcnWaitFormType = (wfLoadPackage,wfLocateFunction,wfSelectData,wfPrepareData);

type
  TcnWaitForm = class(TForm)
    Panel: TPanel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function ShowWaitForm(AOwner: TForm;WaitFormType:TcnWaitFormType): TForm;
procedure CloseWaitForm(wf: TForm);

implementation

{$R *.dfm}
function CreateRGNFromBitmap(rgnBitmap : TBitmap): HRGN;
var TransColor: TColor;
i, j: integer;
i_width, i_height: integer;
i_left, i_right: integer;
rectRGN: HRGN;
begin
 result:=0;

      i_width:=rgnBitmap.Width;
      i_height:=rgnBitmap.Height;
      TransColor:=rgnBitmap.Canvas.Pixels[0,0];

  for i:=0 to i_height-1 do
      begin
        i_left:=-1;

        for j:=0 to i_width do begin
          if i_left<0 then
           begin
            if rgnBitmap.Canvas.Pixels[j,i] <> TransColor then
              i_left:=j;
           end
           else
           if rgnBitmap.Canvas.Pixels[j,i] = TransColor then
              begin
              i_right:=j;
              rectRGN:=CreateRectRgn(i_left, i, i_right, i+1);
              if Result = 0 then Result:=rectRGN
              else
              begin
               CombineRgn(Result, Result, rectRGN,RGN_OR);
               DeleteObject(rectRGN);
               end;
              i_left:=-1;
              end;
              end;
              if i_left>=0 then
              begin
              rectRGN:=CreateRectRgn(i_left, i, i_width, i+1);
              if Result = 0 then Result:=rectRGN
              else
              begin
               CombineRgn(Result, Result, rectRGN,RGN_OR);
               DeleteObject(rectRGN);
               end;
             end;
            end;
end;

function ShowWaitForm(AOwner: TForm;WaitFormType:TcnWaitFormType): TForm;
var
 wf : TcnWaitForm;
begin
 wf := TcnWaitForm.Create(AOwner);
// case WaitFormType of
//  wfLoadPackage: Wf.Memo.Lines.Text:=#13+wfLoadPackage_Const[cnLanguageIndex];
//  wfLocateFunction: Wf.Memo.Lines.Text:=#13+wfLocateFunction_Const[cnLanguageIndex];
//  wfSelectData: Wf.Memo.Lines.Text:=#13+wfSelectData_Const[cnLanguageIndex];
//  wfPrepareData: Wf.Memo.Lines.Text:=#13+wfPrepareData_Const[cnLanguageIndex];
// end;
 Result         := wf;
 if AOwner <> nil then AOwner.Enabled := False;
 Result.Show;
 Result.Update;
end;

procedure CloseWaitForm(wf: TForm);
begin
 if wf.Owner <> nil then (wf.Owner as TForm).Enabled := True;
 wf.Free;
end;

procedure TcnWaitForm.FormCreate(Sender: TObject);
var WindowRGN: HRGN;
begin
 BorderStyle:=bsNone;
 ClientWidth:=Image1.Picture.Bitmap.Width;
 ClientHeight:=Image1.Picture.Bitmap.Height;
 WindowRGN:=CreateRGNFromBitmap(Image1.Picture.Bitmap);
 SetWindowRgn(Handle, WindowRGN, True);
end;

end.
