unit Calendar_EditForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, StdCtrls, cxButtons, ExtCtrls, cxDropDownEdit,
  cxCalendar, cxSpinEdit, cxTimeEdit,TuCommonProc, cxLabel, cxCheckBox,
  TuMessages, cxGraphics, dxStatusBar;

type
  TFormEditCalendar = class(TForm)
    Panel1: TPanel;
    ButtonOK: TcxButton;
    ButtonCancel: TcxButton;
    Panel2: TPanel;
    EditWorkBeg: TcxTimeEdit;
    EditWorkEnd: TcxTimeEdit;
    EditBreakBeg: TcxTimeEdit;
    EditBreakEnd: TcxTimeEdit;
    CheckBoxHoliday: TcxCheckBox;
    Label5: TcxLabel;
    Label4: TcxLabel;
    Label3: TcxLabel;
    Label2: TcxLabel;
    StatusBar2: TdxStatusBar;
    StatusBar1: TdxStatusBar;
    CheckBoxNotSt1: TcxCheckBox;
    Label1: TLabel;
    procedure ButtonOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure CheckBoxHolidayPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    Hours:TTime;
    ExcDate:string;
    NumMode:string;
  end;

var
  FormEditCalendar: TFormEditCalendar;

implementation

{$R *.dfm}

procedure TFormEditCalendar.ButtonOKClick(Sender: TObject);
begin
  if (EditWorkBeg.Text=null)or
     (EditWorkEnd.Text=null)or
     (EditBreakBeg.Text=null)or
     (EditBreakEnd.Text=null) then
  begin
     TuShowMessage(GetConst('Delete','Error'),GetConst('DeleteText','Error'),
                  mtWarning, [mbOK]);
     Exit;
  end ;
  if CheckBoxHoliday.Checked then
  begin
    EditWorkBeg.Time   :=0;
    EditWorkEnd.Time   :=0;
    EditBreakBeg.Time  :=0;
    EditBreakEnd.Time  :=0;
  end ;
  ModalResult:=mrYes;
end;

procedure TFormEditCalendar.FormCreate(Sender: TObject);
begin
 Caption:=GetConst('Update','Button')+ ' ['+GetConst('Calendar','Form')+']' ;
 ButtonOK.Caption:=GetConst('Yes','Button') ;
 ButtonCancel.Caption:=GetConst('Cancel','Button');
 Label2.Caption      :=GetConst('WorkBeg','GridColumn')+':';
 Label3.Caption      :=GetConst('WorkEnd','GridColumn')+':';
 Label4.Caption      :=GetConst('BreakBeg','GridColumn')+':';
 Label5.Caption      :=GetConst('BreakEnd','GridColumn')+':';
 CheckBoxHoliday.Properties.Caption:=GetConst('Holiday','CheckBox');
 CheckBoxNotSt1.Properties.Caption:= GetConst('CheckBoxNotSt1','CheckBox');
end;

procedure TFormEditCalendar.ButtonCancelClick(Sender: TObject);
begin
 ModalResult:=mrNo;
end;

procedure TFormEditCalendar.CheckBoxHolidayPropertiesChange(
  Sender: TObject);
begin
If CheckBoxHoliday.Checked then
begin
  EditWorkBeg.Enabled:=False;
  EditWorkEnd.Enabled:=False;
  EditBreakBeg.Enabled:=False;
  EditBreakEnd.Enabled:=False;
end
else
begin
  EditWorkBeg.Enabled:=true;
  EditWorkEnd.Enabled:=true;
  EditBreakBeg.Enabled:=true;
  EditBreakEnd.Enabled:=true;
end
end;

procedure TFormEditCalendar.FormShow(Sender: TObject);
begin
 StatusBar1.Panels[0].Text:='  '+GetConst('ExcDate','Label')+':   '+ExcDate;
 StatusBar2.Panels[0].Text:='  '+GetConst('NumMode','Label')+': '+NumMode;
end;

end.
