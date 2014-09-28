unit uMnaFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxDropDownEdit,
  cxCalendar, cxTextEdit, cxMaskEdit, cxButtonEdit, cxControls,
  cxContainer, cxEdit, cxCheckBox,ibase,uSpMatOtv, uPackageManager,uSpMatSchMulti,
  cxSpinEdit;

type
  TMnaFilterForm = class(TForm)
    cxfilterSch: TcxCheckBox;
    cxButtonEditRsc: TcxButtonEdit;
    cxButtonEditName: TcxButtonEdit;
    cxCheckBoxName: TcxCheckBox;
    cxCheckBoxMVO: TcxCheckBox;
    cxButtonEditMVO: TcxButtonEdit;
    VibKart: TcxCheckBox;
    cxDateOprBeg: TcxDateEdit;
    cxDateOprEnd: TcxDateEdit;
    cxDateExplBeg: TcxDateEdit;
    cxDateExplEnd: TcxDateEdit;
    cxDateOutBeg: TcxDateEdit;
    cxDateOutEnd: TcxDateEdit;
    cxCheckBoxDateOpr: TcxCheckBox;
    cxCheckBoxDateExpl: TcxCheckBox;
    cxCheckBoxDateOut: TcxCheckBox;
    cxButtonClean: TcxButton;
    cxButtonOk: TcxButton;
    cxButtonCansel: TcxButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cxTipKart: TcxComboBox;
    Label4: TLabel;
    procedure cxfilterSchPropertiesChange(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure cxCheckBox2PropertiesChange(Sender: TObject);
    procedure cxCheckBox4PropertiesChange(Sender: TObject);
    procedure cxCheckBox5PropertiesChange(Sender: TObject);
    procedure cxCheckBox6PropertiesChange(Sender: TObject);
    procedure cxButtonCleanClick(Sender: TObject);
    procedure cxButtonEditRscClick(Sender: TObject);
    procedure cxButtonEditMVOClick(Sender: TObject);
    procedure cxButtonEditNameClick(Sender: TObject);
    procedure cxButtonCanselClick(Sender: TObject);
    procedure cxButtonOkClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
   DBHANDLE : TISC_DB_HANDLE;
   ID_MO, Id_NOMN, ID_SCH:Integer;
   F_SCH:Boolean;
   FILTER_ID_SESSION: integer;
   SCH_NUMBER: string;
   d1,d2:TDateTime;
   tip_kart,pid_mo,pid_nomn,filter_opr,filter_expl,filter_out,vib_k,f_id_session:Integer;
   date_opr_beg,date_opr_end,date_expl_beg,date_expl_end,date_out_beg,date_out_end:TDateTime;
   s_nomn,s_sch,s_mvo: string;
   flag:Integer;
  end;

var
  MnaFilterForm: TMnaFilterForm;

implementation


{$R *.dfm}

procedure TMnaFilterForm.cxfilterSchPropertiesChange(Sender: TObject);
begin
  cxButtonEditRsc.Enabled:=cxfilterSch.Checked;
  if cxfilterSch.Checked then
   cxButtonEditRsc.SetFocus;
end;

procedure TMnaFilterForm.cxCheckBox1PropertiesChange(Sender: TObject);
begin
  cxButtonEditName.Enabled:=cxCheckBoxName.Checked;
  if cxCheckBoxName.Checked then
   cxButtonEditName.SetFocus;
end;

procedure TMnaFilterForm.cxCheckBox2PropertiesChange(Sender: TObject);
begin
  cxButtonEditMVO.Enabled:=cxCheckBoxMVO.Checked;
  if cxCheckBoxMVO.Checked then
   cxButtonEditMVO.SetFocus;
end;

procedure TMnaFilterForm.cxCheckBox4PropertiesChange(Sender: TObject);
begin
 cxDateOprBeg.enabled:=cxCheckBoxDateOpr.checked;
 cxDateOprEnd.enabled:=cxCheckBoxDateOpr.checked;
end;

procedure TMnaFilterForm.cxCheckBox5PropertiesChange(Sender: TObject);
begin
 cxDateExplBeg.enabled:=cxCheckBoxDateExpl.checked;
 cxDateExplEnd.enabled:=cxCheckBoxDateExpl.checked;
end;

procedure TMnaFilterForm.cxCheckBox6PropertiesChange(Sender: TObject);
begin
 cxDateOutBeg.enabled:=cxCheckBoxDateOut.checked;
 cxDateOutEnd.enabled:=cxCheckBoxDateOut.checked;
end;

procedure TMnaFilterForm.cxButtonCleanClick(Sender: TObject);
begin
  cxButtonEditRsc.Text:='';
  cxTipKart.Text:='';
  cxButtonEditName.Text:='';
  cxButtonEditMVO.Text:='';
  cxDateOprBeg.EditText:='';
  cxDateOprEnd.EditText:='';
  cxDateExplBeg.EditText:='';
  cxDateExplEnd.EditText:='';
  cxDateOutBeg.EditText:='';
  cxDateOutEnd.EditText:='';
  cxfilterSch.Checked:=False;
  cxCheckBoxMVO.Checked:=False;
  cxCheckBoxName.Checked:=False;
  cxCheckBoxDateOpr.Checked:=False;
  cxCheckBoxDateExpl.Checked:=False;
  cxCheckBoxDateOut.Checked:=False;
  VibKart.checked:=False;
end;

procedure TMnaFilterForm.cxButtonEditRscClick(Sender: TObject);
var
  Res : Variant;
  mr: boolean;
  VarDimCnt: integer;
  i: integer;
  s: string;
begin
 mr:=false;
 Res:=uSpMatSchMulti.GetMatSchMulti(self, DBHandle, 0, FILTER_ID_SESSION, mr);
 if mr then begin
  if  VarType(Res) <> varEmpty then begin
   VarDimCnt:=VarArrayHighBound(Res,  1);
   s:='';
   for i:=0 to VarDimCnt do begin
    s:=s+VarToStr(Res[i][1])+';';
   end;
   ID_SCH:=Res[0][0];
   SCH_NUMBER:=Res[0][1];
   cxButtonEditRsc.Text := s;
   s_sch:=s;
   F_SCH:=true;
  end
 end
 else
 begin
  F_SCH:=false;
  cxButtonEditRsc.Text:='';
  ID_SCH:=0;
 end;

end;

procedure TMnaFilterForm.cxButtonEditMVOClick(Sender: TObject);
var
  Res : Variant;
  FioMO, SpodrMO: string;
  IsMoOk: boolean;
 dm, dy: Word;
begin
  Res:=uSpMatOtv.GetMatOtv(self, DBHandle, 0, ID_MO);
  if  VarType(Res) <> varEmpty then
  begin
    ID_MO:=Res[0];
    FioMO := Res[1];
    SpodrMO := Res[2];
   cxButtonEditMVO.Text:=FioMO+' / '+SpodrMO;
   s_mvo:=FioMO+' / '+SpodrMO;
  end;
end;

procedure TMnaFilterForm.cxButtonEditNameClick(Sender: TObject);
var
 Res: Variant;
begin
 Res:=uPackageManager.LGetNomn(self, DBHandle, fsNormal, 0, ID_NOMN, 0, 0, 0, 0, 0);
 if  VarType(Res) <> varEmpty then
 begin
  ID_NOMN:=Res[0];
  cxButtonEditName.Text:=Res[1];
  s_nomn:=res[1];
 end;
end;

procedure TMnaFilterForm.cxButtonCanselClick(Sender: TObject);
begin
close;
end;

procedure TMnaFilterForm.cxButtonOkClick(Sender: TObject);
var s:string;
begin
  if flag=0 then
  begin
  pid_nomn:=0;
  tip_kart:=2;
  pid_mo:=0;
  pid_nomn:=0;
  filter_opr:=0;
  filter_expl:=0;
  filter_out:=0;
  vib_k:=0;
  s:='';
  f_id_session:=0;
  date_opr_beg:=StrToDate('31.12.1899');
  date_opr_end:=StrToDate('31.12.1899');
  date_expl_beg:=StrToDate('31.12.1899');
  date_expl_end:=StrToDate('31.12.1899');
  date_out_beg:=StrToDate('31.12.1899');
  date_out_end:=StrToDate('31.12.1899');
  end;

  if cxTipKart.ItemIndex=0 then tip_kart:=2;
  if cxTipKart.ItemIndex=1 then tip_kart:=0;
  if cxTipKart.ItemIndex=2 then tip_kart:=1;
  if  VibKart.Checked then vib_k:=1 else vib_k:=0;

  if (cxfilterSch.Checked) then
  begin
    if (cxButtonEditRsc.text='')then
      f_id_session:=0
    else f_id_session:=FILTER_ID_SESSION;
  end
  else f_id_session:=0;

  if (cxCheckBoxMVO.Checked) then
  begin
    if (cxButtonEditMVO.text='')then
      Pid_Mo:=0
    else PID_MO:=ID_MO;
  end
  else pid_mo:=0;

  if (cxCheckBoxName.Checked) then
  begin
    if (cxButtonEditName.text='')then
      begin
        pid_nomn:=0;
        s_nomn:='';
      end
    else
      begin
        S:=cxButtonEditName.Text;
          if s=s_nomn then pid_nomn:=Id_NOMN
          else
            begin
              pid_nomn:=0;
              s_nomn:=s;
            end;
      end;
  end
  else
    begin
      pid_nomn:=0;
      s_nomn:='';
    end;

  if cxCheckBoxDateOpr.Checked then
  begin
    if (cxDateOprBeg.text='') or (cxDateOprEnd.text='')then filter_opr:=0
    else
      begin
        d1:=cxDateOprBeg.EditValue;
        d2:=cxDateOprEnd.EditValue;
          if (d1>d2) then
            begin
              ShowMessage('ƒата початку повинна бути меньшою за дату к≥нц€!');
              cxDateOprEnd.SetFocus;
              Exit;
            end
          else
            begin
              filter_opr:=1;
              date_opr_beg:=cxDateOprBeg.EditValue;
              date_opr_end:=cxDateOprEnd.EditValue;
            end;
      end;
  end
  else   filter_opr:=0;

  if cxCheckBoxDateExpl.Checked then
  begin
    if (cxDateExplBeg.text='') or (cxDateExplEnd.text='')then filter_expl:=0
    else
      begin
       d1:=cxDateExplBeg.EditValue;
       d2:=cxDateExplEnd.EditValue;
        if (d1>d2) then
          begin
            ShowMessage('ƒата початку повинна бути меньшою за дату к≥нц€!');
            cxDateExplEnd.SetFocus;
            Exit;
          end
        else
         begin
          filter_expl:=1;
          date_expl_beg:=cxDateExplBeg.EditValue;
          date_expl_end:=cxDateExplEnd.EditValue;
         end;
      end;
  end
  else  filter_expl:=0;

  if cxCheckBoxDateOut.Checked then
    begin
      if (cxDateOutBeg.text='') or (cxDateOutEnd.text='')then filter_out:=0
      else
        begin
          d1:=cxDateOutBeg.EditValue;
          d2:=cxDateOutEnd.EditValue;
        if (d1>d2) then
          begin
            ShowMessage('ƒата початку повинна бути меньшою за дату к≥нц€!');
            cxDateOutEnd.SetFocus;
            Exit;
          end
        else
          begin
            filter_out:=1;
            date_out_beg:=cxDateOutBeg.EditValue;
            date_out_end:=cxDateOutEnd.EditValue;
          end;
        end;
    end
    else  filter_out:=0;
flag:=1;
modalresult:=mrOk;

end;

end.
