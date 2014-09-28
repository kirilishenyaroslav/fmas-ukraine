unit uFrameWorkStaj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxControls, cxGridCustomView, cxGridLevel, cxGrid, cxTextEdit, cxCalendar,
  cxCheckBox, cxGroupBox, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ActnList, cxSplitter, cxContainer, cxLabel,uPrK_Resources;

type
  TFrameWorkStaj = class(TFrame)
    cxGroupBoxCalcWorkStaj: TcxGroupBox;
    cxGridCalcStaj: TcxGrid;
    cxGridCalcStajTableView1: TcxGridTableView;
    colDateBeg: TcxGridColumn;
    colDateEnd: TcxGridColumn;
    colSpecStaj: TcxGridColumn;
    cxGridCalcStajLevel1: TcxGridLevel;
    WorkStaj: TActionList;
    ActionCalc: TAction;
    ActionCalcDeleteRec: TAction;
    cxGroupBoxButton: TcxGroupBox;
    cxButtonCalc: TcxButton;
    cxButtonDelRec: TcxButton;
    cxSplitterCalcWorkStaj: TcxSplitter;
    cxLabelMestoRaboti: TcxLabel;
    cxLabelDoljnost: TcxLabel;
    cxTextEditMestoRaboti: TcxTextEdit;
    cxTextEditDoljnost: TcxTextEdit;
    cxLabelAllStaj: TcxLabel;
    cxLabelSpecStaj: TcxLabel;
    cxTextEditAllStaj: TcxTextEdit;
    cxTextEditSpecStaj: TcxTextEdit;
    procedure ActionCalcExecute(Sender: TObject);
    procedure ActionCalcDeleteRecExecute(Sender: TObject);
    procedure cxTextEditAllStajKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditSpecStajKeyPress(Sender: TObject; var Key: Char);
    procedure cxGridCalcStajTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    indLang: integer;
  public
    procedure InicCaptionFrame;
    procedure InicDataFrame(rejim :RejimPrK);
  end;

implementation
uses
    uPRK_DT_ABIT,uConstants, DateUtils;
{$R *.dfm}

{ TFrameWorkStaj }

procedure TFrameWorkStaj.InicCaptionFrame;
var
   i: integer;
begin
    i:=TFormPRK_DT_ABIT(self.Owner).IndLangAbit;
    indLang:=i;
    cxLabelMestoRaboti.Caption        :=nLabelMestoRaboti[i];
    cxLabelDoljnost.Caption           :=nLabelDoljnost[i];
    cxLabelAllStaj.Caption            :=nLabelAllStaj[i];
    cxLabelSpecStaj.Caption           :=nLabelSpecStaj[i];
    cxGroupBoxCalcWorkStaj.Caption    :=nGroupBoxCalcWorkStaj[i];
    colDateBeg.Caption                :=ncolDATE_BEGIN[i];
    colDateEnd.Caption                :=ncolDATE_END[i];
    colSpecStaj.Caption               :=ncolSpecStaj[i];
    ActionCalc.Caption                :=nActionCalc[i];
    ActionCalcDeleteRec.Caption       :=nActionCalcDeleteRec[i];
    ActionCalc.Hint                   :=nHintActionCalc[i];
    ActionCalcDeleteRec.Hint          :=nHintActionCalcDeleteRec[i];


    cxGridCalcStajTableView1.OptionsView.NewItemRowInfoText:=nNewItemRowInfoText[i];

    cxTextEditMestoRaboti.Text        :='';
    cxTextEditDoljnost.Text           :='';
    cxTextEditAllStaj.Text            :='';
    cxTextEditSpecStaj.Text           :='';

    cxGridCalcStajTableView1.Items[0].DataBinding.ValueTypeClass :=TcxDateTimeValueType;
    cxGridCalcStajTableView1.Items[1].DataBinding.ValueTypeClass :=TcxDateTimeValueType;
    cxGridCalcStajTableView1.Items[2].DataBinding.ValueTypeClass :=TcxIntegerValueType;
end;

procedure TFrameWorkStaj.ActionCalcExecute(Sender: TObject);
var
 Date_beg, Date_End: Tdate;
 AllStaj,SpecStaj,k,Kol_vo :Integer;
 i: integer;
begin
    // cxGridCalcStajTableView1.OptionsView.NewItemRow:=false;
    // j :=cxGridCalcStajTableView1.DataController.FocusedRecordIndex;

   AllStaj  :=0;
   SpecStaj :=0;
   cxGridCalcStajTableView1.DataController.Append;
   cxGridCalcStajTableView1.DataController.GotoFirst;
   while not cxGridCalcStajTableView1.DataController.IsEOF do
   begin
        i:=cxGridCalcStajTableView1.DataController.FocusedRecordIndex;
        if i=-1 then Exit;
        if cxGridCalcStajTableView1.DataController.Values[i,0]=null then
         begin
           ShowMessage(nMsgEmptyDateBeg[indLang]);
           exit;
         end;
        if cxGridCalcStajTableView1.DataController.Values[i,1]=null then
         begin
           ShowMessage(nMsgEmptyDateEnd[indLang]);
           exit;
         end;

        Date_beg:=cxGridCalcStajTableView1.DataController.Values[i,0];
        Date_End:=cxGridCalcStajTableView1.DataController.Values[i,1];

        if Date_beg>Date_End then
         begin
           ShowMessage(nMsgDateBegMoreDateEnd[indLang]);
           exit;
         end;

        k:=DayOf(Date_beg); // номер дня в месяце
        if k>15
         then begin
            Date_beg:= EndOfAMonth(YearOf(Date_beg),MonthOf(Date_beg))+1;
            Date_beg:= EncodeDate(YearOf(Date_beg),MonthOf(Date_beg),1);
         end
        else Date_beg:=EncodeDate(YearOf(Date_beg),MonthOf(Date_beg),1);

        k:=DayOf(Date_End);
        if k>15
         then begin
            Date_End:= EndOfAMonth(YearOf(Date_End),MonthOf(Date_End))+1;
            Date_End:= EncodeDate(YearOf(Date_End),MonthOf(Date_End),1);
         end
        else Date_End:=EncodeDate(YearOf(Date_End),MonthOf(Date_End),1);

        Kol_vo  :=MonthsBetween(Date_beg,Date_End);
        AllStaj :=AllStaj +Kol_vo;
        if cxGridCalcStajTableView1.DataController.Values[i,2]=1
         then SpecStaj:=SpecStaj+Kol_vo;

        cxGridCalcStajTableView1.DataController.GotoNext;
   end;

     // так как в Grid'e глюк - Eof срабатывает, когда стоишь на последней записи
     // то для подсчета нужен доплнительный код:
   if cxGridCalcStajTableView1.DataController.IsEof then
   begin
        i:=cxGridCalcStajTableView1.DataController.FocusedRecordIndex;
        if i=-1 then Exit;
        if cxGridCalcStajTableView1.DataController.Values[i,0]=null then
         begin
           ShowMessage(nMsgEmptyDateBeg[indLang]);
           exit;
         end;
        if cxGridCalcStajTableView1.DataController.Values[i,1]=null then
         begin
           ShowMessage(nMsgEmptyDateEnd[indLang]);
           exit;
         end;

        Date_beg:=cxGridCalcStajTableView1.DataController.Values[i,0];
        Date_End:=cxGridCalcStajTableView1.DataController.Values[i,1];

        if Date_beg>Date_End then
         begin
           ShowMessage(nMsgDateBegMoreDateEnd[indLang]);
           exit;
         end;
         
        k:=DayOf(Date_beg); // номер дня в месяце
        if k>15
         then begin
            Date_beg:= EndOfAMonth(YearOf(Date_beg),MonthOf(Date_beg))+1;
            Date_beg:= EncodeDate(YearOf(Date_beg),MonthOf(Date_beg),1);
         end
        else Date_beg:=EncodeDate(YearOf(Date_beg),MonthOf(Date_beg),1);

        k:=DayOf(Date_End);
        if k>15
         then begin
            Date_End:= EndOfAMonth(YearOf(Date_End),MonthOf(Date_End))+1;
            Date_End:= EncodeDate(YearOf(Date_End),MonthOf(Date_End),1);
         end
        else Date_End:=EncodeDate(YearOf(Date_End),MonthOf(Date_End),1);

        Kol_vo  :=MonthsBetween(Date_beg,Date_End);
        AllStaj :=AllStaj +Kol_vo;
        if cxGridCalcStajTableView1.DataController.Values[i,2]=1
         then SpecStaj:=SpecStaj+Kol_vo;
   end;
   cxTextEditAllStaj.Text  := IntToStr(AllStaj);
   cxTextEditSpecStaj.Text := IntToStr(SpecStaj);
end;

procedure TFrameWorkStaj.ActionCalcDeleteRecExecute(Sender: TObject);
var
  i:integer;
begin
    i:=cxGridCalcStajTableView1.DataController.FocusedRecordIndex;
    cxGridCalcStajTableView1.DataController.DeleteRecord(i);
end;

procedure TFrameWorkStaj.cxTextEditAllStajKeyPress(Sender: TObject;
  var Key: Char);
begin
 if (Key = '.') or (Key=',') then Key := Chr(0);
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
    then     Key := Chr(0);
end;

procedure TFrameWorkStaj.cxTextEditSpecStajKeyPress(Sender: TObject;
  var Key: Char);
begin
    if (Key = '.') or (Key=',') then Key := Chr(0);
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
    then     Key := Chr(0);
end;

procedure TFrameWorkStaj.cxGridCalcStajTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
   if AViewInfo.GridRecord.Values[cxGridCalcStajTableView1.IndexOfItem(
                                  cxGridCalcStajTableView1.FindItemByName('colDateBeg'))] = null then
      begin
       ADone := false;
       ACanvas.Brush.Color := clRed;
      end;

   if AViewInfo.GridRecord.Values[cxGridCalcStajTableView1.IndexOfItem(
                                  cxGridCalcStajTableView1.FindItemByName('colDateEnd'))] = null then
      begin
       ADone := false;
       ACanvas.Brush.Color := clRed;
      end;

   if (AViewInfo.GridRecord.Values[cxGridCalcStajTableView1.IndexOfItem(
                                  cxGridCalcStajTableView1.FindItemByName('colDateBeg'))] >
      AViewInfo.GridRecord.Values[cxGridCalcStajTableView1.IndexOfItem(
                                  cxGridCalcStajTableView1.FindItemByName('colDateEnd'))]) then
      begin
       ADone := false;
       ACanvas.Brush.Color := clRed;
      end;
end;

procedure TFrameWorkStaj.InicDataFrame(rejim: RejimPrK);
begin
   if TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['MEST_RAB']<>Null
    then    cxTextEditMestoRaboti.Text   :=TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['MEST_RAB'];
   if TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['DOLGN_RAB']<>Null
    then    cxTextEditDoljnost.Text      :=TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['DOLGN_RAB'];
   if TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['OB_STAG']<>Null
    then    cxTextEditAllStaj.Text        :=TFormPRK_DT_ABIT(self.Owner).DataSetFizlAbit.FieldValues['OB_STAG'];
   if TFormPRK_DT_ABIT(self.Owner).DataSetPrK_ABIT.FieldValues['SPEC_STAG']<>Null
    then    cxTextEditSpecStaj.Text       :=TFormPRK_DT_ABIT(self.Owner).DataSetPrK_ABIT.FieldValues['SPEC_STAG'];

   if rejim=ViewPrK then
   begin
    cxTextEditMestoRaboti.Properties.ReadOnly       :=true;
    cxTextEditDoljnost.Properties.ReadOnly          :=true;
    cxTextEditAllStaj.Properties.ReadOnly           :=true;
    cxTextEditSpecStaj.Properties.ReadOnly          :=true;

    cxTextEditMestoRaboti.Style.Color   :=TFormPRK_DT_ABIT(self.Owner).TextViewColor;
    cxTextEditDoljnost.Style.Color      :=TFormPRK_DT_ABIT(self.Owner).TextViewColor;
    cxTextEditAllStaj.Style.Color       :=TFormPRK_DT_ABIT(self.Owner).TextViewColor;
    cxTextEditSpecStaj.Style.Color      :=TFormPRK_DT_ABIT(self.Owner).TextViewColor;
    
    cxSplitterCalcWorkStaj.Visible :=false;
    cxGroupBoxCalcWorkStaj.Visible :=false;
   end;
end;

end.
