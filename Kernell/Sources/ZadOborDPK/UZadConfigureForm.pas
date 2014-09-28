unit UZadConfigureForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxCheckBox, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxButtonEdit, cxRadioGroup, Placemnt, cxDropDownEdit, cxCalendar;

type
  TfrmGetConfInfo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButtonEdit1: TcxButtonEdit;
    Label1: TLabel;
    ShowSmGr: TcxCheckBox;
    ShowSm: TcxCheckBox;
    ShowRz: TcxCheckBox;
    ShowSt: TcxCheckBox;
    ShowKv: TcxCheckBox;
    Label4: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    edTypeSmGrInfo: TcxRadioGroup;
    edTypeSmInfo: TcxRadioGroup;
    edTypeRzInfo: TcxRadioGroup;
    edTypeStInfo: TcxRadioGroup;
    edTypeKvInfo: TcxRadioGroup;
    cxButton2: TcxButton;
    ShowProgram: TcxCheckBox;
    edProgramInfo: TcxRadioGroup;
    FormStorage1: TFormStorage;
    cxDateEdit1: TcxDateEdit;
    EdSchFilter: TcxCheckBox;
    ShowSch: TcxCheckBox;
    edTypeSchInfo: TcxRadioGroup;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton2Click(Sender: TObject);
    procedure EdSchFilterPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    tempID_SCH:Int64;
  public
    { Public declarations }
    DateBeg:TDateTime;
    id_sch:Int64;
    constructor Create(AOwner:TComponent;DateBeg:TDateTime);overload;
  end;

implementation

uses GlobalSpr,Resources_unitb,BaseTypes,DateUtils,UZadMainResults;
{$R *.dfm}

constructor TfrmGetConfInfo.Create(AOwner: TComponent; DateBeg:TDateTime);
begin
     inherited Create(AOwner);
     self.DateBeg:=DateBeg;
     cxDateEdit1.Date:=DateBeg;
     id_sch:=-1;
     tempID_SCH:=-1;
end;

procedure TfrmGetConfInfo.cxButton1Click(Sender: TObject);
begin
     TfrmMainResults(self.Owner).Panel2.Caption:='Аналіз залишків по матеріальних рахунках на '+DateToStr(cxdateEdit1.date);
     self.DateBeg:=cxDateEdit1.Date;
     ModalResult:=mrYes;
end;

procedure TfrmGetConfInfo.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Res:Variant;
begin
       Res:=GlobalSpr.GetSchEx(self,TfrmMainResults(self.Owner).WorkDatabase.handle,
                               fsNormal,
                               Date ,
                               DEFAULT_ROOT_ID,2,id_sch);
       if VarArrayDimCount(RES)>0
       then begin
               id_sch:=RES[0][0];
               cxButtonEdit1.Text:='Залишки по рахунку '+VarToStr(RES[0][3])+' "'+RES[0][1]+'"';
       end;
end;

procedure TfrmGetConfInfo.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmGetConfInfo.EdSchFilterPropertiesChange(Sender: TObject);
begin
     cxButtonEdit1.Enabled:=EdSchFilter.Checked;
     if EdSchFilter.Checked
     then begin
               ID_SCH:=tempID_SCH;
               tempID_SCH:=-1;
     end
     else begin
               tempID_SCH:=ID_SCH;
               ID_SCH:=-1;
               cxButtonEdit1.Text:='Залишки по всім матеріальним рахункам';
     end;

end;

end.
