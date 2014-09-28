unit USmetaFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxButtonEdit, StdCtrls, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxControls, cxContainer, cxEdit,
  cxCheckBox, cxButtons, ExtCtrls;

type
  TfrmSmFilter = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    CheckActivity: TcxCheckBox;
    CheckPeriod: TcxCheckBox;
    EdDateBeg: TcxDateEdit;
    EdDateEnd: TcxDateEdit;
    CheckGroup: TcxCheckBox;
    EdSmGroup: TcxButtonEdit;
    CheckDateBeg: TcxCheckBox;
    CheckDateEnd: TcxCheckBox;
    CheckCurDate: TcxCheckBox;
    EdCurDate: TcxDateEdit;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckPeriodPropertiesChange(Sender: TObject);
    procedure EdSmGroupPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CheckGroupPropertiesChange(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure CheckCurDatePropertiesChange(Sender: TObject);
    procedure CheckDateBegPropertiesChange(Sender: TObject);
    procedure CheckDateEndPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ID_SM_GROUP:Int64;
  end;



implementation

uses GlobalSpr, USprSmeta;

{$R *.dfm}

procedure TfrmSmFilter.cxButton1Click(Sender: TObject);
begin
      ModalResult:=mrYes;
end;

procedure TfrmSmFilter.cxButton2Click(Sender: TObject);
begin
      ModalResult:=mrNo;
end;

procedure TfrmSmFilter.FormCreate(Sender: TObject);
begin
     EdCurDate.Date:=Date;
     EdDateBeg.Date:=Date;
     EdDateEnd.Date:=Date;
end;

procedure TfrmSmFilter.CheckPeriodPropertiesChange(Sender: TObject);
begin
     CheckCurDate.Enabled:=CheckPeriod.Checked;
     CheckDateBeg.Enabled:=CheckPeriod.Checked;
     CheckDateEnd.Enabled:=CheckPeriod.Checked;
end;

procedure TfrmSmFilter.EdSmGroupPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Res:Variant;
begin
    Res:=GlobalSpr.GetSmGrp(self,TfrmSmetaSpr(Owner).WorkDatabase.Handle,fsNormal,0,TfrmSmetaSpr(Owner).id_user);
    if VarArrayDimCount(Res)>0
    then begin
           ID_SM_GROUP:=VarAsType(Res[0], varInt64) ;
           EdSmGroup.Text:=VarToStr(Res[1]);
    end;
end;

procedure TfrmSmFilter.CheckGroupPropertiesChange(Sender: TObject);
begin
     EdSmGroup.Enabled:=CheckGroup.Checked;
end;

procedure TfrmSmFilter.cxButton3Click(Sender: TObject);
begin
    CheckActivity.Checked:=false;
    CheckPeriod.Checked:=false;
    CheckGroup.Checked:=false;
    CheckDateBeg.Checked:=false;
    CheckDateEnd.Checked:=false;
    CheckCurDate.Checked:=false;

    CheckPeriod.Properties.OnChange(self);
    CheckGroup.Properties.OnChange(self);
    CheckDateBeg.Properties.OnChange(self);
    CheckDateEnd.Properties.OnChange(self);
    CheckCurDate.Properties.OnChange(self);
end;

procedure TfrmSmFilter.CheckCurDatePropertiesChange(Sender: TObject);
begin
      EdCurDate.Enabled:=CheckCurDate.Checked;
end;

procedure TfrmSmFilter.CheckDateBegPropertiesChange(Sender: TObject);
begin
      EdDateBeg.Enabled:=CheckDateBeg.Checked;
end;

procedure TfrmSmFilter.CheckDateEndPropertiesChange(Sender: TObject);
begin
      EdDateEnd.Enabled:=CheckDateEnd.Checked;
end;

end.
