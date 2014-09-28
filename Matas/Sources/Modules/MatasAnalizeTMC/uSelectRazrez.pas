unit uSelectRazrez;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
  cxMaskEdit, cxSpinEdit, cxControls, cxContainer, cxEdit, cxCheckBox,
  FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  Grids, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  DBGrids, uRepAnalizeTMC, Registry;

type
  TSelRazr = class(TForm)
    CBGrTMC: TcxCheckBox;
    Label1: TLabel;
    SEUroven: TcxSpinEdit;
    CBMOL: TcxCheckBox;
    CBBalSch: TcxCheckBox;
    CBKorSch: TcxCheckBox;
    CBByut: TcxCheckBox;
    CBRozd: TcxCheckBox;
    CBStat: TcxCheckBox;
    CBKekv: TcxCheckBox;
    CBNameTMC: TcxCheckBox;
    Label2: TLabel;
    cxButton1: TcxButton;
    procedure CBGrTMCPropertiesChange(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    zapros:string;
    tip:Integer;
    gruppa,uroven_gr,mol,bal_sch,kor_sch,byut,razd,stat,kekv,name_nomn,kol_vo:Integer;
  end;

var
  SelRazr: TSelRazr;

implementation

{$R *.dfm}

procedure TSelRazr.CBGrTMCPropertiesChange(Sender: TObject);
begin
 SEUroven.Enabled:= CBGrTMC.Checked;
end;

procedure TSelRazr.cxButton1Click(Sender: TObject);
var FM:TRepAnalizeTMCForm;
    uroven:integer;
    polya,sum,sort_pol:string;
    zap,sch:string;
begin
  polya:='';
  sort_pol:='';
  zap:='';
  kol_vo:=0;
  if tip=2 then
  begin
    if CBBalSch.Checked then
    begin
      if not(polya='') then zap:=',';
      polya:=polya+zap+' Id_Sch, Sch_Number, Sch_Title';
      sort_pol:=sort_pol+zap+' Sch_Number';
      bal_sch:=1;
    end
  else bal_sch:=0;

  if CBGrTMC.Checked then
    begin
      if not(polya='') then zap:=',';
      if SEUroven.Value=1 then
      begin
       polya:=polya+zap+'Id_Group_4, Name_Group4 ';
       sort_pol:=sort_pol+zap+' Name_Group4';
      end;
      if SEUroven.Value=2 then
      begin
       polya:=polya+zap+'Id_Group_4, Id_Group_3, Name_Group4, Name_Group3';
       sort_pol:=sort_pol+zap+' Name_Group4, Name_Group3';
      end;
      if SEUroven.Value=3 then
      begin
       polya:=polya+zap+'Id_Group_4, Id_Group_3, Id_Group_2, Name_Group4, Name_Group3, Name_Group2 ';
       sort_pol:=sort_pol+zap+' Name_Group4, Name_Group3, Name_Group2';
      end;
      if SEUroven.Value=4 then
      begin
       polya:=polya+zap+'Id_Group_4, Id_Group_3, Id_Group_2, Id_Group_1, Name_Group4, Name_Group3, Name_Group2, Name_Group1 ';
       sort_pol:=sort_pol+zap+' Name_Group4, Name_Group3, Name_Group2, Name_Group1';
      end;
      uroven_gr:=SEUroven.Value;
    end
  else uroven_gr:=0;
  if CBMOL.Checked then
    begin
      if not(polya='') then zap:=',';

       polya:=polya+zap+' Id_Mo, Fio_Mo, Sfio_Mo, Dep_Mo';
       sort_pol:=sort_pol+zap+' Sfio_Mo, Dep_Mo';

      mol:=1;
    end
  else mol:=0;
  if CBKorSch.Checked then
    begin
      if not(polya='') then zap:=',';

       polya:=polya+zap+' Kr_cor_Id_Sch, Kr_cor_Sch_Number, kr_cor_Sch_Title, db_cor_Id_Sch, db_cor_Sch_Number, db_cor_Sch_Title ';
       sort_pol:=sort_pol+zap+' Kr_cor_Sch_Number, db_cor_Sch_Number';

      kor_sch:=1;
      kol_vo:=kol_vo+1;
    end
  else kor_sch:=0;
  if CBByut.Checked then
    begin
      if not(polya='') then zap:=',';

       polya:=polya+zap+' Id_Sm, Sm_Title, Sm_Kod';
       sort_pol:=sort_pol+zap+' Sm_Kod';

      byut:=1;
      kol_vo:=kol_vo+1;
    end
  else byut:=0;
  if CBRozd.Checked then
    begin
      if not(polya='') then zap:=',';

       polya:=polya+zap+' Id_Rz, Rz_Title, Rz_Kod';
       sort_pol:=sort_pol+zap+' Rz_Kod';

      razd:=1;
      kol_vo:=kol_vo+1;
    end
  else razd:=0;
  if CBStat.Checked then
    begin
      if not(polya='') then zap:=',';

       polya:=polya+zap+' Id_St, St_Title, St_Kod';
       sort_pol:=sort_pol+zap+' St_Kod';

      stat:=1;
      kol_vo:=kol_vo+1;
    end
  else stat:=0;
  if CBKekv.Checked then
    begin
      if not(polya='') then zap:=',';

       polya:=polya+zap+' Id_Kekv, Kekv_Title, Kekv_Kod';
       sort_pol:=sort_pol+zap+' Kekv_Kod';

      kekv:=1;
      kol_vo:=kol_vo+1;
    end
  else kekv:=0;
  if CBNameTMC.Checked then
    begin
      if not(polya='') then zap:=',';
      polya:=polya+zap+' Name, Nomn, Short_Name, Date_opr';
      sort_pol:=sort_pol+zap+' Name, Nomn, Short_Name, Date_opr';
      name_nomn:=1;
    end
  else name_nomn:=0;
    if CBNameTMC.Checked then sum:=' , Summa'
    else sum:=', sum(Summa) as Summa';

    if not(polya='') then zap:=',';
    sch:=zap+' Bal_Id_Sch, Bal_Sch_Number, Bal_Sch_Title';

 // if polya='' then zapros:='SELECT'+sch+sum+' FROM MAT_SEL_NOMN_OPER_FULL(:date_beg,:date_end,:session,:grtmc,:tmc,:debet,:kredit,:rozd_stat,:kekv,:byutj,:tip)'
      zapros:='SELECT '+polya+sch+sum+' FROM MAT_OBOROT_TMC_SEL(:date_beg,:date_end,:session,:grtmc,:tmc,:debet,:kredit,:rozd_stat,:kekv,:byutj)';

   //   if not CBNameTMC.Checked then  zapros:=zapros+' GROUP BY '+ polya + sch
   //    else  zapros:=zapros+' GROUP BY '+ polya + sch +sum;

   if not CBNameTMC.Checked then  zapros:=zapros+' GROUP BY '+ polya + sch +sum;
   //    else
      zapros:=zapros+' ORDER BY '+sort_pol+sch;

  end
  else
  begin
  if CBBalSch.Checked then
    begin
      if not(polya='') then zap:=',';
     if tip=0 then
     begin
      polya:=polya+zap+' Db_Id_Sch, Db_Sch_Number, Db_Sch_Title';
      sort_pol:=sort_pol+zap+' Db_Sch_Number';
     end;
     if tip=1 then
     begin
      polya:=polya+zap+' Kr_Id_Sch, Kr_Sch_Number, Kr_Sch_Title';
      sort_pol:=sort_pol+zap+' Kr_Sch_Number';
     end;
     bal_sch:=1;
    end
  else bal_sch:=0;

  if CBGrTMC.Checked then
    begin
      if not(polya='') then zap:=',';
      if SEUroven.Value=1 then
      begin
       polya:=polya+zap+'Id_Group_4, Name_Group4 ';
       sort_pol:=sort_pol+zap+' Name_Group4';
      end;
      if SEUroven.Value=2 then
      begin
       polya:=polya+zap+'Id_Group_4, Id_Group_3, Name_Group4, Name_Group3';
       sort_pol:=sort_pol+zap+' Name_Group4, Name_Group3';
      end;
      if SEUroven.Value=3 then
      begin
       polya:=polya+zap+'Id_Group_4, Id_Group_3, Id_Group_2, Name_Group4, Name_Group3, Name_Group2 ';
       sort_pol:=sort_pol+zap+' Name_Group4, Name_Group3, Name_Group2';
      end;
      if SEUroven.Value=4 then
      begin
       polya:=polya+zap+'Id_Group_4, Id_Group_3, Id_Group_2, Id_Group_1, Name_Group4, Name_Group3, Name_Group2, Name_Group1 ';
       sort_pol:=sort_pol+zap+' Name_Group4, Name_Group3, Name_Group2, Name_Group1';
      end;
      uroven_gr:=SEUroven.Value;
    end
  else uroven_gr:=0;
  if CBMOL.Checked then
    begin
      if not(polya='') then zap:=',';
      if tip=0 then
      begin
       polya:=polya+zap+' Id_Mo_In, Fio_Mo_In, Sfio_Mo_In, Dep_Mo_In';
       sort_pol:=sort_pol+zap+' Sfio_Mo_In, Dep_Mo_In';
      end;
      if tip=1 then
      begin
       polya:=polya+zap+' Id_Mo_Out, Fio_Mo_Out, Sfio_Mo_Out, Dep_Mo_Out';
       sort_pol:=sort_pol+zap+' Sfio_Mo_Out, Dep_Mo_Out';
      end;
      mol:=1;
    end
  else mol:=0;
  if CBKorSch.Checked then
    begin
      if not(polya='') then zap:=',';
      if tip=0 then
      begin
       polya:=polya+zap+' Kr_Id_Sch, Kr_Sch_Number, Kr_Sch_Title';
       sort_pol:=sort_pol+zap+' Kr_Sch_Number';
      end;
      if tip=1 then
      begin
       polya:=polya+zap+' Db_Id_Sch, Db_Sch_Number, Db_Sch_Title';
       sort_pol:=sort_pol+zap+' Db_Sch_Number';
      end;
      kor_sch:=1;
      kol_vo:=kol_vo+1;
    end
  else kor_sch:=0;
  if CBByut.Checked then
    begin
      if not(polya='') then zap:=',';
      if tip=0 then
      begin
       polya:=polya+zap+' Db_Id_Sm, Db_Sm_Title, Db_Sm_Kod';
       sort_pol:=sort_pol+zap+' Db_Sm_Kod';
      end
      else
      begin
       polya:=polya+zap+' Kr_Id_Sm, Kr_Sm_Title, Kr_Sm_Kod';
       sort_pol:=sort_pol+zap+' Kr_Sm_Kod';
      end;
      byut:=1;
      kol_vo:=kol_vo+1;
    end
  else byut:=0;
  if CBRozd.Checked then
    begin
      if not(polya='') then zap:=',';
      if tip=0 then
      begin
       polya:=polya+zap+' Db_Id_Rz, Db_Rz_Title, Db_Rz_Kod';
       sort_pol:=sort_pol+zap+' Db_Rz_Kod';
      end
      else
      begin
       polya:=polya+zap+' Kr_Id_Rz, Kr_Rz_Title, Kr_Rz_Kod';
       sort_pol:=sort_pol+zap+' Kr_Rz_Kod';
      end;
      razd:=1;
      kol_vo:=kol_vo+1;
    end
  else razd:=0;
  if CBStat.Checked then
    begin
      if not(polya='') then zap:=',';
      if tip=0 then
      begin
       polya:=polya+zap+' Db_Id_St, Db_St_Title, Db_St_Kod';
       sort_pol:=sort_pol+zap+' Db_St_Kod';
      end
      else
      begin
       polya:=polya+zap+' Kr_Id_St, Kr_St_Title, Kr_St_Kod';
       sort_pol:=sort_pol+zap+' Kr_St_Kod';
      end;
      stat:=1;
      kol_vo:=kol_vo+1;
    end
  else stat:=0;
  if CBKekv.Checked then
    begin
      if not(polya='') then zap:=',';
      if tip=0 then
      begin
       polya:=polya+zap+' Db_Id_Kekv, Db_Kekv_Title, Db_Kekv_Kod';
       sort_pol:=sort_pol+zap+' Db_Kekv_Kod';
      end
      else
      begin
       polya:=polya+zap+' Kr_Id_Kekv, Kr_Kekv_Title, Kr_Kekv_Kod';
       sort_pol:=sort_pol+zap+' Kr_Kekv_Kod';
      end;
      kekv:=1;
      kol_vo:=kol_vo+1;
    end
  else kekv:=0;
  if CBNameTMC.Checked then
    begin
      if not(polya='') then zap:=',';
      polya:=polya+zap+' Name, Nomn, Short_Name, Date_opr';
      sort_pol:=sort_pol+zap+' Name, Nomn, Short_Name, Date_opr';
      name_nomn:=1;
    end
  else name_nomn:=0;
    if CBNameTMC.Checked then sum:=',Kol_Mat, Summa'
    else sum:=',sum(Kol_Mat) as Kol_mat, sum(Summa) as Summa';

    if not(polya='') then zap:=',';
    if tip=0 then  sch:=zap+' Bal_Db_Id_Sch, Bal_Db_Sch_Number, Bal_Db_Sch_Title'
    else sch:=zap+' Bal_Kr_Id_Sch, Bal_Kr_Sch_Number, Bal_Kr_Sch_Title';
 // if polya='' then zapros:='SELECT'+sch+sum+' FROM MAT_SEL_NOMN_OPER_FULL(:date_beg,:date_end,:session,:grtmc,:tmc,:debet,:kredit,:rozd_stat,:kekv,:byutj,:tip)'
      zapros:='SELECT '+polya+sch+sum+' FROM MAT_SEL_NOMN_OPER_FULL(:date_beg,:date_end,:session,:grtmc,:tmc,:debet,:kredit,:rozd_stat,:kekv,:byutj,:tip)';

   //   if not CBNameTMC.Checked then  zapros:=zapros+' GROUP BY '+ polya + sch
   //    else  zapros:=zapros+' GROUP BY '+ polya + sch +sum;

   if not CBNameTMC.Checked then  zapros:=zapros+' GROUP BY '+ polya + sch +sum;
   //    else
      zapros:=zapros+' ORDER BY '+sort_pol+sch;

   //  showmessage(zapros);
   end
end;

procedure TSelRazr.FormShow(Sender: TObject);
var  reg: TRegistry;
begin
reg:=TRegistry.Create;
try
  reg.RootKey:=HKEY_CURRENT_USER;
  if  reg.OpenKey('\Software\MATAS\Login\',False) then
  begin
    if reg.ReadString('gr_tmc')='1' then  CBGrTMC.Checked:=True else CBGrTMC.Checked:=False;
    if reg.ReadString('ur_grp')='' then SEUroven.Value:=1
    else SEUroven.Value:= StrToInt(reg.ReadString('ur_grp'));
    if reg.ReadString('mol')='1' then  CBMOL.Checked:=True else CBMOL.Checked:=False;
    if reg.ReadString('bal_sch')='1' then  CBBalSch.Checked:=True else CBBalSch.Checked:=False;
    if reg.ReadString('cor_sch')='1' then  CBKorSch.Checked:=True else CBKorSch.Checked:=False;
    if reg.ReadString('but')='1' then  CBByut.Checked:=True else CBByut.Checked:=False;
    if reg.ReadString('rz')='1' then  CBRozd.Checked:=True else CBRozd.Checked:=False;
    if reg.ReadString('st')='1' then  CBStat.Checked:=True else CBStat.Checked:=False;
    if reg.ReadString('kekv')='1' then  CBKekv.Checked:=True else CBKekv.Checked:=False;
    if reg.ReadString('name_n')='1' then  CBNameTMC.Checked:=True else CBNameTMC.Checked:=False;
  end
 finally
  reg.Free;
 end;
end;

procedure TSelRazr.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var  reg: TRegistry;
begin
  reg := TRegistry.Create;
  try
   reg.RootKey:=HKEY_CURRENT_USER;
   if  reg.OpenKey('\Software\MATAS\Login\',True) then
   begin
    if CBGrTMC.Checked then reg.WriteString('gr_tmc','1') else reg.WriteString('gr_tmc','0');
    reg.WriteString('ur_grp',InttoStr(SEUroven.Value));
    if CBMOL.Checked then reg.WriteString('mol','1') else reg.WriteString('mol','0');
    if CBBalSch.Checked then reg.WriteString('bal_sch','1') else reg.WriteString('bal_sch','0');
    if CBKorSch.Checked then reg.WriteString('cor_sch','1') else reg.WriteString('cor_sch','0');
    if CBByut.Checked then reg.WriteString('but','1') else reg.WriteString('but','0');
    if CBRozd.Checked then reg.WriteString('rz','1') else reg.WriteString('rz','0');
    if CBStat.Checked then reg.WriteString('st','1') else reg.WriteString('st','0');
    if CBKekv.Checked then reg.WriteString('kekv','1') else reg.WriteString('kekv','0');
    if CBNameTMC.Checked then reg.WriteString('name_n','1') else reg.WriteString('name_n','0');

   end
  finally
   reg.Free;
 end;
end;

end.
