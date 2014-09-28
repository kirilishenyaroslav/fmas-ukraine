unit uFrameOcenki;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxContainer, cxEdit, cxLabel, cxControls, cxGroupBox, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, RxMemDS, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxMRUEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxCalc, Grids, cxCheckBox, Menus, StdCtrls,
  FIBDataSet, pFIBDataSet, cxCurrencyEdit,uPrK_Resources;

type
  TFrameOcenki = class(TFrame)
    cxGroupBoxOcenki: TcxGroupBox;
    RxMemoryDataOcenki: TRxMemoryData;
    DataSourceOcenki: TDataSource;
    cxGridPrKOcenki: TcxGrid;
    cxGridPrKOcenkiDBTableView1: TcxGridDBTableView;
    cxGridPrKOcenkiLevel1: TcxGridLevel;
    cxGroupBoxSredniyBal: TcxGroupBox;
    cxPopupEditSeredniyBal: TcxPopupEdit;
    cxLabelCalcSerednBal: TcxLabel;
    PopupMenuSerBal: TPopupMenu;
    PopMenuCountSerBal: TMenuItem;
    PopMenuClear: TMenuItem;
    DataSetOcenki: TpFIBDataSet;
    colNAME: TcxGridDBColumn;
    colOCENKA: TcxGridDBColumn;
    colIS_OLD_AT: TcxGridDBColumn;
    RxMemoryDataCanUpdateOcenki: TRxMemoryData;
    cxGroupBoxCalcSrBal: TcxGroupBox;
    StringGridSredniyBal: TStringGrid;
    cxCheckBoxBalOn5System: TcxCheckBox;
    cxLabelBalOn5System: TcxLabel;
    procedure StringGridSredniyBalKeyPress(Sender: TObject; var Key: Char);
    procedure PopMenuCountSerBalClick(Sender: TObject);
    procedure PopMenuClearClick(Sender: TObject);
    procedure cxPopupEditSeredniyBalKeyPress(Sender: TObject;
      var Key: Char);
    procedure RxMemoryDataOcenkiAfterPost(DataSet: TDataSet);
    procedure cxGridPrKOcenkiDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxCheckBoxBalOn5SystemEditing(Sender: TObject;
      var CanEdit: Boolean);
  private
    IndLang: integer;
    FSelectSQLTextOcenki: string;
    FSelectTextFrameOcenki: boolean;
    procedure SetSelectSQLTextOcenki(const Value: string);
    procedure SetSelectTextFrameOcenki(const Value: boolean);
    procedure GetObnovDataSetOcenki;
  public
    procedure InicCaptionFrame;
    procedure OnActiveSheetOcenki;
    procedure InicDataFrame(rejim :RejimPrK);
    function CanChangeSheet: Boolean;
    property SelectTextFrameOcenki :boolean read FSelectTextFrameOcenki write SetSelectTextFrameOcenki;
    property SelectSQLTextOcenki :string read FSelectSQLTextOcenki write SetSelectSQLTextOcenki;
  end;

implementation
uses
    uPRK_DT_ABIT,uConstants, Math;
{$R *.dfm}

{ TFrameOcenki }

procedure TFrameOcenki.InicCaptionFrame;
var
   i: integer;
begin
    i:=TFormPRK_DT_ABIT(self.Owner).IndLangAbit;
    IndLang:=i;
    cxGroupBoxOcenki.Caption        :=ncxGroupBoxOcenki[i];
    cxGroupBoxSredniyBal.Caption    :=ncxGroupBoxSredniyBal[i];
    colNAME.Caption                 :=ncolNAME[i];
    colOCENKA.Caption               :=ncolOCENKA[i];
    colIS_OLD_AT.Caption            :=ncolIS_OLD_AT[i];
    cxLabelBalOn5System.Caption     :=nLabelBalOn5System[i];
    cxLabelCalcSerednBal.Caption    :=nLabelCalcSerednBal[i];
    PopMenuCountSerBal.Caption      :=nPopMenuCountSerBal[i];
    PopMenuClear.Caption            :=nPopMenuClear[i];


    StringGridSredniyBal.Left:=0;
    StringGridSredniyBal.Top :=0;
    StringGridSredniyBal.DefaultColWidth  :=30;
    StringGridSredniyBal.DefaultRowHeight :=30;
    StringGridSredniyBal.Height           :=6*30+5;
    StringGridSredniyBal.Width            :=6*30+5;
    cxGroupBoxCalcSrBal.Height            :=6*30+40;
    cxGroupBoxCalcSrBal.Width             :=6*30+5;
end;

procedure TFrameOcenki.StringGridSredniyBalKeyPress(Sender: TObject;var Key: Char);
var
  text : string;
begin
    if (Key = '.') or (Key=',') then Key := Chr(0);
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
    then     Key := Chr(0);

    if (StringGridSredniyBal.Cells[StringGridSredniyBal.Col,StringGridSredniyBal.Row]='') and (Ord(Key) = 48)
     then Key := Chr(0);
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
     then text:='0'
     else text:= StringGridSredniyBal.Cells[StringGridSredniyBal.Col,StringGridSredniyBal.Row]+Key;
    if cxCheckBoxBalOn5System.Checked=true then
     begin
        if StrToInt(text)>5  then  Key := Chr(0);
     end
     else begin
        if StrToInt(text)>12 then  Key := Chr(0);
     end;
end;

procedure TFrameOcenki.PopMenuCountSerBalClick(Sender: TObject);
var
   i,j,ch,zn  :integer;
   SrBal      :Double;
   Ocenka     :integer;
begin
    ch:=0;
    zn:=0;
    for i:=0 to 5 do
     begin
        for j:=0 to 5 do
         begin
            if StringGridSredniyBal.Cells[i,j]<>'' then
             begin
                Ocenka:=StrToInt(StringGridSredniyBal.Cells[i,j]);
                if cxCheckBoxBalOn5System.Checked=true then
                 begin
                   case Ocenka of
                    2: Ocenka:=2;
                    3: Ocenka:=5;
                    4: Ocenka:=8;
                    5: Ocenka:=11;
                   end;
                 end;

                ch:=ch+Ocenka;
                zn:=zn+1;
             end;
         end;
     end;

    if zn=0
     then SrBal:=0
     else SrBal:=ch/zn;
    cxPopupEditSeredniyBal.Text := FloatToStr(RoundTo(SrBal,-1));
    cxCheckBoxBalOn5System.SetFocus;
    cxPopupEditSeredniyBal.SetFocus;
end;

procedure TFrameOcenki.PopMenuClearClick(Sender: TObject);
var
   i,j : integer;
begin
   for i:=0 to 5 do
     begin
        for j:=0 to 5 do
         begin
            StringGridSredniyBal.Cells[i,j]:='';
         end;
     end;
end;

procedure TFrameOcenki.cxPopupEditSeredniyBalKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (Key = '.') or (Key=',') then Key := DecimalSeparator;
   //****** »зменено 04.01.07 *******\\
     {if cxCheckBoxBalOn5System.Checked=true then
     begin
          // если не найдено, то возврашает ноль
          if Pos(DecimalSeparator,cxPopupEditSeredniyBal.Text)<1
            then begin
              if  Ord(Key) > 53 then Key := Chr(0);
              if Trim(cxPopupEditSeredniyBal.Text)='' then exit; // из-за этого могут быть бока
              if StrToInt(cxPopupEditSeredniyBal.Text)>0
               then if ((Ord(Key)=48) or (Ord(Key)=49) or (Ord(Key)=50)) then Key := Chr(0);
            end
            else begin
               if cxPopupEditSeredniyBal.Text=('5'+DecimalSeparator)
                then if ((Ord(Key) > 47) and (Ord(Key) < 58))
                       then Key := Chr(0);
            end;
     end;  }
  //****************************\\
end;

procedure TFrameOcenki.SetSelectTextFrameOcenki(const Value: boolean);
begin
  FSelectTextFrameOcenki := Value;
  if  FSelectTextFrameOcenki=true then
   begin
      SelectSQLTextOcenki  :='Select * from PRK_DT_OCEN_AT_SELECT(:ID_SP_DEPARTMENT_FAKU,:ID_CN_JN_FACUL_SPEC,:ID_CN_SP_FORM_STUD,:ID_CN_SP_KAT_STUD,:ID_MAN,:ID_SP_GOD_NABORA)';
   end;
end;


procedure TFrameOcenki.SetSelectSQLTextOcenki(const Value: string);
begin
  FSelectSQLTextOcenki := Value;

  RxMemoryDataCanUpdateOcenki.Open;
  RxMemoryDataCanUpdateOcenki.Insert;
    RxMemoryDataCanUpdateOcenki.FieldByName('ID_CN_SP_FAK').Value          :=0;
    RxMemoryDataCanUpdateOcenki.FieldByName('ID_CN_JN_FACUL_SPEC').Value   :=0;
    RxMemoryDataCanUpdateOcenki.FieldByName('ID_CN_SP_FORM_STUD').Value    :=0;
    RxMemoryDataCanUpdateOcenki.FieldByName('ID_CN_SP_KAT_STUD').Value     :=0;
    RxMemoryDataCanUpdateOcenki.FieldByName('ID_MAN').Value                :=0;
    RxMemoryDataCanUpdateOcenki.FieldByName('ID_SP_GOD_NABORA').Value      :=TFormPRK_DT_ABIT(self.Owner).ResultArray['Input']['GODNABORA'].AsInt64;

  RxMemoryDataCanUpdateOcenki.Post;

    DataSetOcenki.Active                         :=false;
    DataSetOcenki.Database                       := TFormPRK_DT_ABIT(self.Owner).DataBasePrK_ABIT;
    DataSetOcenki.Transaction                    := TFormPRK_DT_ABIT(self.Owner).TransactionReadPrK_ABIT;
    DataSetOcenki.SelectSQL.Clear;
    DataSetOcenki.SQLs.SelectSQL.Text            := FSelectSQLTextOcenki;
    DataSetOcenki.ParamByName('ID_SP_DEPARTMENT_FAKU').AsInt64        :=TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetFacul.FieldValues['ID_CN_SP_FAK'];
    DataSetOcenki.ParamByName('ID_CN_JN_FACUL_SPEC').AsInt64          :=TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetSpec.FieldValues['ID_CN_JN_FACUL_SPEC'];
    DataSetOcenki.ParamByName('ID_CN_SP_FORM_STUD').AsInt64           :=TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetFormStudy.FieldValues['ID_CN_SP_FORM_STUD'];
    DataSetOcenki.ParamByName('ID_CN_SP_KAT_STUD').AsInt64            :=TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetKatStud.FieldValues['ID_CN_SP_KAT_STUD'];
    DataSetOcenki.ParamByName('ID_MAN').AsInt64                       :=TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_MAN'].AsInt64;
    DataSetOcenki.ParamByName('ID_SP_GOD_NABORA').AsInt64             :=TFormPRK_DT_ABIT(self.Owner).ResultArray['Input']['GODNABORA'].AsInt64;
    DataSetOcenki.CloseOpen(false);
    DataSetOcenki.FetchAll;
    RxMemoryDataOcenki.LoadFromDataSet(DataSetOcenki,DataSetOcenki.RecordCount,lmCopy);
    DataSetOcenki.Active:=false;
    
end;

procedure TFrameOcenki.OnActiveSheetOcenki;
begin

    // ѕроверка на то: ѕомен€лись ли во TFrameVstup1 парметры, если да то
    // происходит обновление DataSetOcenki
    // “ака€ организаци€ if'ов провер€ет сначала наиболее веро€тные возможности изменени€
    if RxMemoryDataCanUpdateOcenki.FieldByName('ID_CN_SP_FORM_STUD').Value <>
       TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetFormStudy.FieldValues['ID_CN_SP_FORM_STUD']
       then GetObnovDataSetOcenki
       else if RxMemoryDataCanUpdateOcenki.FieldByName('ID_CN_JN_FACUL_SPEC').Value <>
               TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetSpec.FieldValues['ID_CN_JN_FACUL_SPEC']
               then GetObnovDataSetOcenki
               else if RxMemoryDataCanUpdateOcenki.FieldByName('ID_CN_SP_FAK').Value <>
                       TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetFacul.FieldValues['ID_CN_SP_FAK']
                       then GetObnovDataSetOcenki
                       else if RxMemoryDataCanUpdateOcenki.FieldByName('ID_CN_SP_KAT_STUD').Value<>
                               TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetKatStud.FieldValues['ID_CN_SP_KAT_STUD']
                               then GetObnovDataSetOcenki
                               else if RxMemoryDataCanUpdateOcenki.FieldByName('ID_MAN').Value<>
                                       TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_MAN'].AsInt64
                                        then GetObnovDataSetOcenki;
end;

procedure TFrameOcenki.RxMemoryDataOcenkiAfterPost(DataSet: TDataSet);
begin
  if DataSetOcenki.Active=true then exit;
  if RxMemoryDataOcenki.FieldByName('OCENKA').Value>5
    then if RxMemoryDataOcenki.FieldByName('IS_OLD_AT').Value=1 then
          begin
            ShowMessage(nMsgOcenkaOn5System[IndLang]);
          end;  
end;

procedure TFrameOcenki.cxGridPrKOcenkiDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
   if AViewInfo.GridRecord.Values[cxGridPrKOcenkiDBTableView1.IndexOfItem(cxGridPrKOcenkiDBTableView1.FindItemByName('colIS_OLD_AT'))] = 1
      then  if AViewInfo.GridRecord.Values[cxGridPrKOcenkiDBTableView1.IndexOfItem(cxGridPrKOcenkiDBTableView1.FindItemByName('colOCENKA'))] > 5 then
            begin
             ADone := false;
             ACanvas.Brush.Color := clRed;
            end;
end;

function TFrameOcenki.CanChangeSheet: Boolean;
begin
  result:=true;
  if DataSetOcenki.Active=true then exit;
  RxMemoryDataOcenki.edit;
  RxMemoryDataOcenki.Post;
  if DataSetOcenki.Active=true then exit;
  RxMemoryDataOcenki.First;
  while not RxMemoryDataOcenki.Eof do
  begin
    if RxMemoryDataOcenki.FieldByName('OCENKA').Value>5
      then if RxMemoryDataOcenki.FieldByName('IS_OLD_AT').Value=1 then
            begin
              result:=false;
            end;
    RxMemoryDataOcenki.Next;
  end;
end;

procedure TFrameOcenki.cxCheckBoxBalOn5SystemEditing(Sender: TObject;
  var CanEdit: Boolean);
var
  i,j: integer;
  myRect: TGridRect;
begin
{   if trim(cxPopupEditSeredniyBal.Text)='' then exit;
   if StrToFloat(cxPopupEditSeredniyBal.Text)>5 then
    begin
        ShowMessage(nMsgSrBalOn5System[IndLang]);
        CanEdit:=false;
        cxPopupEditSeredniyBal.SetFocus;
    end;  }
    for i:=0 to 5 do
     begin
        for j:=0 to 5 do
         begin
            if StringGridSredniyBal.Cells[i,j]<>'' then
             begin
                if strtoint(StringGridSredniyBal.Cells[i,j])>5 then
                 begin
                    ShowMessage(nMsgOcenkaOn5System[IndLang]);
                    CanEdit:=false;
                     myRect.Left   := i;
                     myRect.Right  := i;
                     myRect.Top    := j;
                     myRect.Bottom := j;
                    StringGridSredniyBal.Selection  := myRect;
                    exit;
                 end;
             end;
         end;
     end;
end;

procedure TFrameOcenki.GetObnovDataSetOcenki;
begin
    RxMemoryDataCanUpdateOcenki.Edit;
       RxMemoryDataCanUpdateOcenki.FieldByName('ID_CN_SP_FORM_STUD').Value  :=
               TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetFormStudy.FieldValues['ID_CN_SP_FORM_STUD'];
       RxMemoryDataCanUpdateOcenki.FieldByName('ID_CN_JN_FACUL_SPEC').Value :=
               TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetSpec.FieldValues['ID_CN_JN_FACUL_SPEC'];
       RxMemoryDataCanUpdateOcenki.FieldByName('ID_CN_SP_FAK').Value        :=
               TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetFacul.FieldValues['ID_CN_SP_FAK'];
       RxMemoryDataCanUpdateOcenki.FieldByName('ID_CN_SP_KAT_STUD').Value   :=
               TFormPRK_DT_ABIT(self.Owner).TFrameVstup1.DataSetKatStud.FieldValues['ID_CN_SP_KAT_STUD'];
       RxMemoryDataCanUpdateOcenki.FieldByName('ID_MAN').Value              :=
               TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_MAN'].AsInt64;
       RxMemoryDataCanUpdateOcenki.FieldByName('ID_SP_GOD_NABORA').Value    :=
               TFormPRK_DT_ABIT(self.Owner).ResultArray['Input']['GODNABORA'].AsInt64;
    RxMemoryDataCanUpdateOcenki.Post;


    DataSetOcenki.ParamByName('ID_SP_DEPARTMENT_FAKU').AsInt64   :=RxMemoryDataCanUpdateOcenki.FieldByName('ID_CN_SP_FAK').Value;
    DataSetOcenki.ParamByName('ID_CN_JN_FACUL_SPEC').AsInt64     :=RxMemoryDataCanUpdateOcenki.FieldByName('ID_CN_JN_FACUL_SPEC').Value;
    DataSetOcenki.ParamByName('ID_CN_SP_FORM_STUD').AsInt64      :=RxMemoryDataCanUpdateOcenki.FieldByName('ID_CN_SP_FORM_STUD').Value;
    DataSetOcenki.ParamByName('ID_CN_SP_KAT_STUD').AsInt64       :=RxMemoryDataCanUpdateOcenki.FieldByName('ID_CN_SP_KAT_STUD').Value;
    DataSetOcenki.ParamByName('ID_MAN').AsInt64                  :=RxMemoryDataCanUpdateOcenki.FieldByName('ID_MAN').Value;
    DataSetOcenki.ParamByName('ID_SP_GOD_NABORA').AsInt64        :=RxMemoryDataCanUpdateOcenki.FieldByName('ID_SP_GOD_NABORA').Value;
    DataSetOcenki.CloseOpen(false);
    DataSetOcenki.FetchAll;
    RxMemoryDataOcenki.LoadFromDataSet(DataSetOcenki,DataSetOcenki.RecordCount,lmCopy);
    DataSetOcenki.Active:=false;
end;

procedure TFrameOcenki.InicDataFrame(rejim: RejimPrK);
begin
// ¬озможно сдесь автоматически будут отбиратьс€ те данные, которые надо...
// ѕотому что сначала инициализируетс€ FrameVstyp... а в зависимости от него завис€щиее вкладки
//    Ќадо проверить
/////////////
 

   cxPopupEditSeredniyBal.Text :=TFormPRK_DT_ABIT(self.Owner).DataSetPrK_ABIT.FieldValues['SBAL'];

   if rejim=ViewPrK then
   begin
       DataSourceOcenki.AutoEdit:= false;
       cxCheckBoxBalOn5System.Properties.ReadOnly:=true;
       cxPopupEditSeredniyBal.Properties.ReadOnly:=true;
       cxPopupEditSeredniyBal.Properties.PopupControl.Destroy;

       cxPopupEditSeredniyBal.Style.Color                  :=TFormPRK_DT_ABIT(self.Owner).TextViewColor;
       // мен€€ так цвет - € мен€ю его в самом cxCtyleSkyBlue. ≈стественно он изменитс€ и вовсех компонентах исользующих этот стиль
       cxGridPrKOcenkiDBTableView1.Styles.Content.Color    :=TFormPRK_DT_ABIT(self.Owner).TextViewColor;
       cxGridPrKOcenkiDBTableView1.Styles.Background.Color :=TFormPRK_DT_ABIT(self.Owner).TextViewColor;
   end;
end;

end.
