unit USmGrFonds;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  SmGrMain,pFibStoredProc;

type
  TfrmSmGrFonds = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButtonEdit1: TcxButtonEdit;
    cxButtonEdit2: TcxButtonEdit;
    Label1: TLabel;
    cbMonthEnd: TComboBox;
    cbMonthBeg: TComboBox;
    cbYearBeg: TComboBox;
    cbYearEnd: TComboBox;
    Label3: TLabel;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    cxButtonEdit3: TcxButtonEdit;
    Label4: TLabel;
    cxButtonEdit4: TcxButtonEdit;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure cxButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit4PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }

  public
    { Public declarations }
    edit_flag:boolean;
    in_date_beg:TdateTime;
    in_date_end:TdateTime;
    id_rasx_sch:integer;
    id_prih_sch:integer;
    id_sch_ll:Variant;
    id_sch_ll_nv:Variant;
    date_beg:TDateTime;
    date_end:TDateTime;
    function CheckData:Boolean;
  end;

implementation
uses GlobalSpr,Resources_unitb, DateUtils, BaseTypes;

{$R *.dfm}

procedure TfrmSmGrFonds.FormShow(Sender: TObject);
var i:Integer;
begin
       cbMonthBeg.Items.Add(TRIM(BU_Month_01));
       cbMonthBeg.Items.Add(TRIM(BU_Month_02));
       cbMonthBeg.Items.Add(TRIM(BU_Month_03));
       cbMonthBeg.Items.Add(TRIM(BU_Month_04));
       cbMonthBeg.Items.Add(TRIM(BU_Month_05));
       cbMonthBeg.Items.Add(TRIM(BU_Month_06));
       cbMonthBeg.Items.Add(TRIM(BU_Month_07));
       cbMonthBeg.Items.Add(TRIM(BU_Month_08));
       cbMonthBeg.Items.Add(TRIM(BU_Month_09));
       cbMonthBeg.Items.Add(TRIM(BU_Month_10));
       cbMonthBeg.Items.Add(TRIM(BU_Month_11));
       cbMonthBeg.Items.Add(TRIM(BU_Month_12));

       cbMonthEnd.Items.Add(TRIM(BU_Month_01));
       cbMonthEnd.Items.Add(TRIM(BU_Month_02));
       cbMonthEnd.Items.Add(TRIM(BU_Month_03));
       cbMonthEnd.Items.Add(TRIM(BU_Month_04));
       cbMonthEnd.Items.Add(TRIM(BU_Month_05));
       cbMonthEnd.Items.Add(TRIM(BU_Month_06));
       cbMonthEnd.Items.Add(TRIM(BU_Month_07));
       cbMonthEnd.Items.Add(TRIM(BU_Month_08));
       cbMonthEnd.Items.Add(TRIM(BU_Month_09));
       cbMonthEnd.Items.Add(TRIM(BU_Month_10));
       cbMonthEnd.Items.Add(TRIM(BU_Month_11));
       cbMonthEnd.Items.Add(TRIM(BU_Month_12));

       for i:=0 to YEARS_COUNT do
       begin
          cbYearBeg.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
          cbYearEnd.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
       end;

    if edit_flag
    then begin
       cbMonthbeg.ItemIndex:=MonthOf(in_date_beg)-1;
       for i:=0 to cbYearBeg.Items.Count-1 do
       begin
           if pos(cbYearBeg.Items[i],IntToStr(YearOf(in_date_beg)))>0
           then begin
              cbYearBeg.ItemIndex:=i;
              break;
           end;
       end;
       cbMonthend.ItemIndex:=MonthOf(in_date_end)-1;
       for i:=0 to cbYearend.Items.Count-1 do
       begin
           if pos(cbYearend.Items[i],IntToStr(YearOf(in_date_end)))>0
           then begin
              cbYearend.ItemIndex:=i;
              break;
           end;
       end;

    end
    else begin
         cbMonthbeg.ItemIndex:=MonthOf(Date)-1;
         cbMonthend.ItemIndex:=cbMonthbeg.ItemIndex;
         for i:=0 to cbYearBeg.Items.Count-1 do
         begin
           if pos(cbYearBeg.Items[i],IntToStr(YearOf(Date)))>0
           then begin
              cbYearBeg.ItemIndex:=i;
              cbYearEnd.ItemIndex:=i;
              break;
           end;
         end;
    end;
end;

procedure TfrmSmGrFonds.cxButtonEdit2PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
   var Res:Variant;
begin
       Res:=GlobalSpr.GetSch(self,TfrmSmetaGroup(owner).WorkDatabase.handle,fsNormal,date,DEFAULT_ROOT_ID,0,0);
       if (VarArrayDimCount(RES)>0)
       then begin
             id_rasx_sch:=RES[0][0];
             cxButtonEdit2.Text:='№ '+VarToStr(RES[0][3])+' "'+VarToStr(RES[0][1])+'"';
       end;
end;

procedure TfrmSmGrFonds.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
   var Res:Variant;
begin
       Res:=GlobalSpr.GetSch(self,TfrmSmetaGroup(owner).WorkDatabase.handle,fsNormal, date  ,DEFAULT_ROOT_ID,0,0);
       if (VarArrayDimCount(RES)>0)
       then begin
             id_prih_sch:=RES[0][0];
             cxButtonEdit1.Text:='№ '+VarToStr(RES[0][3])+' "'+VarToStr(RES[0][1])+'"';
       end;
end;

procedure TfrmSmGrFonds.cxButton2Click(Sender: TObject);
begin
     if CheckData
     then begin
               ModalResult:=mrYes;
     end;
end;

procedure TfrmSmGrFonds.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

function TfrmSmGrFonds.CheckData: Boolean;
var Res:Boolean;
begin
     try
             date_beg:=StrToDate('01.'+IntToStr(cbMonthbeg.ItemIndex+1)+'.'+cbYearbeg.Items[cbYearbeg.ItemIndex]);

             if (cbMonthend.ItemIndex+1<=11)
             then begin
                       date_end:=StrToDate('01.'+IntToStr(cbMonthend.ItemIndex+2)+'.'+cbYearend.Items[cbYearend.ItemIndex]);
                       date_end:=date_end-1;
             end
             else begin
                       date_end:=StrToDate('01.01.'+cbYearend.Items[cbYearend.ItemIndex+1]);
                       date_end:=date_end-1;
             end;


            Res:=true;
            if (date_beg>date_end) and Res and CheckBox1.Checked
            then begin
                       BaseTypes.agMessageDlg('Увага!','Дата початку періоду не може бути більною за закінчення.',mtWarning,[mbOk]);
                       Res:=false;
            end;
            if ((cxButtonEdit1.Text='') or (cxButtonEdit2.Text='')) and Res
            then begin
                       BaseTypes.agMessageDlg('Увага!','Треба вибрати фонди.',mtWarning,[mbOk]);
                       Res:=false;
            end;

    except on E:Exception do
           begin
                agShowMessage(E.Message);
                Res:=False;
           end;
    end;

    Result:=Res;

end;

procedure TfrmSmGrFonds.CheckBox1Click(Sender: TObject);
begin
     if CheckBox1.Checked
     then begin
          cbMonthEnd.Enabled:=true;
          cbMonthEnd.Color:=clInfoBk;
          cbMonthEnd.Font.Color:=clBlack;
          cbYearEnd.Enabled:=true;
          cbYearEnd.Color:=clInfoBk;
          cbYearEnd.Font.Color:=clBlack;
     end
     else begin
          cbMonthEnd.Enabled:=false;
          cbMonthEnd.Color:=clMenu;
          cbMonthEnd.Font.Color:=clMenu;
          cbYearEnd.Enabled:=false;
          cbYearEnd.Color:=clMenu;
          cbYearEnd.Font.Color:=clMenu;
     end;
end;

procedure TfrmSmGrFonds.cxButtonEdit3PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
   var Res:Variant;
begin
       Res:=GlobalSpr.GetSch(self,TfrmSmetaGroup(owner).WorkDatabase.handle,fsNormal, date  ,DEFAULT_ROOT_ID,0,0);
       if (VarArrayDimCount(RES)>0)
       then begin
             id_sch_ll:=RES[0][0];
             cxButtonEdit3.Text:='№ '+VarToStr(RES[0][3])+' "'+VarToStr(RES[0][1])+'"';
       end;
end;

procedure TfrmSmGrFonds.cxButtonEdit4PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
   var Res:Variant;
begin
       Res:=GlobalSpr.GetSch(self,TfrmSmetaGroup(owner).WorkDatabase.handle,fsNormal, date  ,DEFAULT_ROOT_ID,0,0);
       if (VarArrayDimCount(RES)>0)
       then begin
             id_sch_ll_nv:=RES[0][0];
             cxButtonEdit4.Text:='№ '+VarToStr(RES[0][3])+' "'+VarToStr(RES[0][1])+'"';
       end;

end;

end.
