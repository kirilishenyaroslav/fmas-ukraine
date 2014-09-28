unit Gar_Waybilll_Filter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxDropDownEdit, cxCalendar, ActnList, DB,
  FIBDataSet, pFIBDataSet, cxTextEdit, cxCheckBox, cxLabel, cxContainer,
  cxEdit, cxMaskEdit, cxButtonEdit, cxControls, cxGroupBox, StdCtrls,
  cxButtons, ExtCtrls, gar_Types, FIBQuery, pFIBQuery, pFIBStoredProc, gr_uCommonProc,
  gar_GarageProc,DateUtils ,gar_LoadPackageGarage,gar_Waybill_DM;

type
  TFWaybilll_Filter = class(TForm)
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    GroupBoxProp: TcxGroupBox;
    EditMan: TcxButtonEdit;
    EditManFio: TcxLabel;
    cxCheckBox6: TcxCheckBox;
    cxGroupBox2: TcxGroupBox;
    cxButtonEdit1: TcxButtonEdit;
    cxLabel1: TcxLabel;
    cxCheckBox3: TcxCheckBox;
    cxGroupBox12: TcxGroupBox;
    cxTextEdit11: TcxTextEdit;
    cxCheckBox2: TcxCheckBox;
    cxGroupBox13: TcxGroupBox;
    cxCheckBox1: TcxCheckBox;
    pFIBDataSet1: TpFIBDataSet;
    DataSource1: TDataSource;
    ActionList1: TActionList;
    Action1: TAction;
    cxGroupBox3: TcxGroupBox;
    cxCheckBox4: TcxCheckBox;
    LabelVidopl: TcxLabel;
    cxLabel2: TcxLabel;
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    pFIBStoredProc1: TpFIBStoredProc;
    Action2: TAction;
    pFIBDataSet2: TpFIBDataSet;
    DataSource2: TDataSource;
    cxTextEdit12: TcxMaskEdit;
    CheckBoxF2: TcxCheckBox;
    CheckBoxF3: TcxCheckBox;
    Action3: TAction;
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure cxCheckBox4PropertiesChange(Sender: TObject);
    procedure cxCheckBox6PropertiesChange(Sender: TObject);
    procedure cxCheckBox3PropertiesChange(Sender: TObject);
    procedure cxCheckBox2PropertiesChange(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    constructor Create(Param:TgarParamWaybillFilter); reintroduce;
    procedure EditManPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditManPropertiesEditValueChanged(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit1PropertiesEditValueChanged(Sender: TObject);
    procedure CheckBoxF2PropertiesChange(Sender: TObject);
    procedure CheckBoxF3PropertiesChange(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure PrepareDataWaybillFilter(Param: TgarParamWaybillFilter);

  public
    ParamLoc:TgarParamWaybillFilter;
  end;

var
  FWaybilll_Filter: TFWaybilll_Filter;

function View_FFilter(Param:TgarParamWaybillFilter):variant;

implementation

{$R *.dfm}

function View_FFilter(Param:TgarParamWaybillFilter):variant;
begin
  FWaybilll_Filter:=TFWaybilll_Filter.Create(Param);
  FWaybilll_Filter.PrepareDataWaybillFilter(Param);

  if FWaybilll_Filter.ShowModal = mrYes then
  begin
    Result:=True;
  end

  else
  begin
    Result:=False;
  end;

  FWaybilll_Filter.Free;
end;

{ TFWaybilll_Filter }

procedure TFWaybilll_Filter.PrepareDataWaybillFilter(
  Param: TgarParamWaybillFilter);
var a, b, c :word;
tem:Tdatetime;
kod_setup : Integer;
begin
  case Param.fs of
    garfsShow:
      begin
        CheckBoxF3.Checked:=True;
        CheckBoxF2.Checked:=True;

        cxCheckBox6.Checked:=False;
        cxCheckBox4.Checked:=True;
        cxCheckBox3.Checked:=False;
        cxCheckBox2.Checked:=False;
        cxCheckBox1.Checked:=False;

        cxDateEdit1.Enabled:=True;
        cxDateEdit2.Enabled:=True;

        EditMan.Enabled:=False;
        cxButtonEdit1.Enabled:=False;
        cxTextEdit11.Enabled:=False;
        cxTextEdit12.Enabled:=False;


        cxDateEdit1.Date:=grGetFDateKS(Global_Kod_Setup(Param.DB_Handle));
        DecodeDate(cxDateEdit1.Date, a, b, c);

        {нужно правильно ставить конец мес€ца!!!}
        //если мес€ц = 12, то
        b := b + 1;
        if b > 12 then
         Begin
           b := 1;
           a := a + 1;
         end;
        cxDateEdit2.Date := EncodeDate(a, b, 1) - 1


        //cxDateEdit2 :=EncodeDate(a, b, MonthOf(cxDateEdit1.Date));
        //First := DecMonth(EncodeDate(Y,M,1));
        //Last := EncodeDate(Y,M,1) -1;
      end;
    garfsUpdate:
      begin
        if Param.id_forma=2 then
          begin
            CheckBoxF3.Checked:=False;
            CheckBoxF2.Checked:=True;
          end
          else if Param.id_forma=3 then
          begin
            CheckBoxF2.Checked:=False;
            CheckBoxF3.Checked:=True;
          end
          else if Param.id_forma=-1 then
          begin
            CheckBoxF3.Checked:=True;
            CheckBoxF2.Checked:=True;
          end;


          if  Param.DATE_BEG<>null then
            begin
              cxCheckBox4.Checked:=True;
              cxDateEdit1.Enabled:=True;
              cxDateEdit2.Enabled:=True;
              cxDateEdit1.EditValue:=Param.DATE_BEG;
              cxDateEdit2.EditValue:=Param.DATE_END;
            end
          else
            begin
              cxCheckBox4.Checked:=False;
              cxDateEdit1.Enabled:=False;
              cxDateEdit2.Enabled:=False;
            end;


          if Param.ParamPeople.id<>-1 then
            begin
              cxCheckBox6.Checked:=True;
              EditMan.Enabled:=True;
              EditMan.Text:=Param.ParamPeople.Tn;
              EditManFio.EditValue:=Param.ParamPeople.Caption;
            end
          else
            begin
              cxCheckBox6.Checked:=False;
              EditMan.Enabled:=False;
            end;

          if Param.ParamAvto.id<>-1 then
            begin
              cxCheckBox3.Checked:=True;
              cxButtonEdit1.Enabled:=True;
              cxButtonEdit1.Text:=Param.ParamAvto.Tn;
              cxLabel1.EditValue:=Param.ParamAvto.Caption;
            end
          else
            begin
              cxCheckBox3.Checked:=False;
              cxButtonEdit1.Enabled:=False;
            end;

          if Param.SERIES<>'' then
            begin
              cxCheckBox2.Checked:=True;
              cxTextEdit11.Enabled:=True;
              cxTextEdit11.EditValue:=Param.SERIES;
            end
          else
            begin
              cxCheckBox2.Checked:=False;
              cxTextEdit11.Enabled:=False;
            end;

            if Param.NOMBER<>null then
            begin
              cxCheckBox1.Checked:=True;
              cxTextEdit12.Enabled:=True;
              cxTextEdit12.EditValue:=Param.NOMBER;
            end
            else
              begin
                cxCheckBox1.Checked:=False;
                cxTextEdit12.Enabled:=False;
              end;


      end
  end;
end;

procedure TFWaybilll_Filter.Action1Execute(Sender: TObject);
var a,b,c:Word;
begin
   if ( (CheckBoxF2.Checked and CheckBoxF3.checked)) then
     ParamLoc.id_forma:=-1
   else if CheckBoxF3.Checked  then
      ParamLoc.id_forma:=3
   else if CheckBoxF2.Checked  then
      ParamLoc.id_forma:=2;

   if cxCheckBox4.Checked then
    begin
      ParamLoc.DATE_BEG:=cxDateEdit1.EditValue;
      ParamLoc.DATE_End:=cxDateEdit2.EditValue;
    end  
   else
    begin
        {ParamLoc.DATE_BEG:=grGetFDateKS(Global_Kod_Setup(ParamLoc.DB_Handle));
        DecodeDate(ParamLoc.DATE_BEG, a, b, c);
        ParamLoc.DATE_End := EncodeDate(a, b+1, 1) - 1;   }
        ParamLoc.DATE_BEG:=null;
        ParamLoc.DATE_End:=null;
    end;

   if cxCheckBox2.Checked then
    ParamLoc.SERIES  :=VarToStrDef(cxTextEdit11.EditValue,'')
   else  ParamLoc.SERIES  := '';
   if cxCheckBox1.Checked then
    ParamLoc.NOMBER  :=cxTextEdit12.EditValue
   else  ParamLoc.NOMBER  :=NULL;

   if (EditManFio.Caption='') and (cxCheckBox6.Checked) then
      ParamLoc.ParamPeople.id:=-1
   else  if  not cxCheckBox6.Checked then
      ParamLoc.ParamPeople.id:=-1;

   if (cxLabel1.Caption='') and (cxCheckBox3.Checked) then
      ParamLoc.ParamAvto.id:=-1
   else  if  not cxCheckBox3.Checked then
      ParamLoc.ParamAvto.id:=-1;

   ModalResult:=mrYes;
end;

procedure TFWaybilll_Filter.Action2Execute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TFWaybilll_Filter.cxCheckBox4PropertiesChange(Sender: TObject);
begin
  cxDateEdit1.Enabled:=not cxDateEdit1.Enabled;
  cxDateEdit2.Enabled:=not cxDateEdit2.Enabled;
end;

procedure TFWaybilll_Filter.cxCheckBox6PropertiesChange(Sender: TObject);
begin
  EditMan.Enabled:=not EditMan.Enabled;
end;

procedure TFWaybilll_Filter.cxCheckBox3PropertiesChange(Sender: TObject);
begin
  cxButtonEdit1.Enabled:=not cxButtonEdit1.Enabled;
end;

procedure TFWaybilll_Filter.cxCheckBox2PropertiesChange(Sender: TObject);
begin
  cxTextEdit11.Enabled:=not cxTextEdit11.Enabled;
end;

procedure TFWaybilll_Filter.cxCheckBox1PropertiesChange(Sender: TObject);
begin
  cxTextEdit12.Enabled:=not cxTextEdit12.Enabled;
end;

constructor TFWaybilll_Filter.Create(Param: TgarParamWaybillFilter);
begin
  inherited create(Param.Owner);
  ParamLoc:=Param;
end;









procedure TFWaybilll_Filter.EditManPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Man:variant;
param:TgarSimpleParamMode;
begin
  param:=TgarSimpleParamMode.Create;
  param.DB_Handle:=ParamLoc.DB_Handle;
  Param.Owner:=self;
  Param.fs:=garfsSelect;
  man:=LoadPackageGarage(Param, Name_Gar_Sp_People);
  if VarArrayDimCount(Man)>0 then
   begin
     if man[0]<>NULL then
      begin
        ParamLoc.ParamPeople.id:=man[0];
        ParamLoc.ParamPeople.Tn:=grifThen(VarIsNull(Man[1]),0,Man[1]);
        ParamLoc.ParamPeople.Caption:=Man[2];
        EditManFio.Caption := ParamLoc.ParamPeople.Caption;
        EditMan.Text := IntToStr(ParamLoc.ParamPeople.Tn);
      end;
   end;

   Param.Free;


end;

procedure TFWaybilll_Filter.EditManPropertiesEditValueChanged(
  Sender: TObject);
var man:Variant;
begin
if EditMan.Text<>'' then
 begin
  if StrToInt(EditMan.Text)=ParamLoc.ParamPeople.Tn then Exit;
  man:=Gar_ManByTn(StrToInt(EditMan.Text),ParamLoc.DB_Handle);
  if VarArrayDimCount(man)>0 then
   begin
    ParamLoc.ParamPeople.Id:=man[0];
    ParamLoc.ParamPeople.Tn:=grifThen(VarIsNull(Man[1]),0,Man[1]);
    ParamLoc.ParamPeople.Caption:=man[2];
    EditManFio.Caption := ParamLoc.ParamPeople.Caption;
   end
  else
   EditMan.SetFocus;


 end;

end;

procedure TFWaybilll_Filter.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var avto:variant;
param:TgarSimpleParamMode;
begin
  param:=TgarSimpleParamMode.Create;
  param.DB_Handle:=ParamLoc.DB_Handle;
  Param.Owner:=self;
  Param.fs:=garfsSelect;
  avto:=LoadPackageGarage(Param, Name_Gar_Sp_Avto);
  if VarArrayDimCount(avto)>0 then
   begin
     if avto[0]<>NULL then
      begin
        ParamLoc.ParamAvto.id:=avto[0];
        ParamLoc.ParamAvto.Tn:=VarToStrDef(avto[1],'');
        ParamLoc.ParamAvto.Caption:=VarToStrDef(avto[2],'');
        cxLabel1.Caption := ParamLoc.ParamAvto.Caption;
        cxButtonEdit1.Text := ParamLoc.ParamAvto.Tn;
      end;
   end;

   pFIBDataSet2.Close;
   pFIBDataSet2.SQLs.SelectSQL.Text:='SELECT * FROM GAR_WAYBILL_PREPAREDATA_BY_AVTO('+VarToStr(ParamLoc.ParamAvto.id)+')';
   pFIBDataSet2.Open;
   Param.Free;

end;

procedure TFWaybilll_Filter.cxButtonEdit1PropertiesEditValueChanged(
  Sender: TObject);
var avto:Variant;
begin
if cxButtonEdit1.Text<>'' then
 begin
  if cxButtonEdit1.Text=VarToStr(ParamLoc.ParamAvto.Tn) then Exit;
  avto:=Gar_Avto_By_NOM_GOS(VarToStr(cxButtonEdit1.Text),ParamLoc.DB_Handle);
  if VarArrayDimCount(avto)>0 then
   begin
    ParamLoc.ParamAvto.Id:=avto[0];
    ParamLoc.ParamAvto.Tn:=grifThen(VarIsNull(avto[1]),0,avto[1]);
    ParamLoc.ParamAvto.Caption:=avto[2];
    cxLabel1.Caption := VarToStr(ParamLoc.ParamAvto.Caption);
    cxButtonEdit1.Text:=VarToStr(ParamLoc.ParamAvto.tn);

   end
  else
   cxButtonEdit1.SetFocus;


end;

end;

procedure TFWaybilll_Filter.CheckBoxF2PropertiesChange(Sender: TObject);
begin
  if (not (CheckBoxF2.Checked or CheckBoxF3.checked)) then
  CheckBoxF2.Checked:=True;
end;

procedure TFWaybilll_Filter.CheckBoxF3PropertiesChange(Sender: TObject);
begin
  if (not (CheckBoxF3.Checked or CheckBoxF2.checked)) then
  CheckBoxF3.Checked:=True;
end;

procedure TFWaybilll_Filter.Action3Execute(Sender: TObject);
begin
      if  cxButton1.Focused Then Action1Execute(Sender);
      if  cxButton2.Focused Then Action2Execute(Sender);
      SendKeyDown(Self.ActiveControl,VK_TAB,[]);
end;

procedure TFWaybilll_Filter.FormShow(Sender: TObject);
begin
  cxButton1.SetFocus;
end;

end.
