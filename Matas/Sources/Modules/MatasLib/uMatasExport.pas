{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uMatasExport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxLookAndFeelPainters, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, DB,
  FIBDataSet, pFIBDataSet, OleServer, ExcelXP, uResources, cxCheckListBox,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxCheckBox, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxGridCustomView, cxGridLevel, cxGrid, CheckLst, ActnList, ExtCtrls;

type
  TfmExport = class(TForm)
    Label1: TLabel;
    cxFilaName: TcxButtonEdit;
    SaveDialog1: TSaveDialog;
    cxExport: TcxButton;
    cxExit: TcxButton;
    cxButtonAll: TcxButton;
    cxButtonNone: TcxButton;
    cxButtonID: TcxButton;
    cxCheckListFields: TCheckListBox;
    Shape1: TShape;
    ActionList1: TActionList;
    acExit: TAction;
    procedure cxFilaNamePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxExitClick(Sender: TObject);
    procedure cxExportClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButtonAllClick(Sender: TObject);
    procedure cxButtonNoneClick(Sender: TObject);
    procedure cxButtonIDClick(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FDataSet: TpFIBDataSet;
    constructor Create(aOwner: TComponent; aDataSet: TpFIBDataSet);
  end;
  function GetRusName (EngName:string):string;

var
  fmExport: TfmExport;

implementation

uses uMatasUtils;

{$R *.dfm}

procedure TfmExport.cxFilaNamePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
 if SaveDialog1.Execute then
  cxFilaName.Text:=SaveDialog1.FileName;
end;

procedure TfmExport.cxExitClick(Sender: TObject);
begin
 Close;
end;

procedure TfmExport.cxExportClick(Sender: TObject);

var
  fXl  : TExcelApplication;
  lcid: cardinal;
  R,C, i: integer;
  ASheet: _Worksheet;
  vData: Variant;
  nRec, nf: integer;
  w: TForm;
begin
  if SaveDialog1.FileName='' then
  begin
   ShowMessage('Потрібно вказати назву файла!');
   exit;
  end;
  w:=ShowWaitWindow(self);
  FDataSet.FetchAll;
  lcid := GetUserDefaultLCId;
  fXL := TExcelApplication.Create(nil);
  try
    fXL.ConnectKind := ckNewInstance;
    fXl.Application.AutomationSecurity := 1;
    fXL.DisplayAlerts[lcid] := False;
    fXL.AutoQuit := false;
    fXL.Visible[lcid] := false;
    fXL.Connect;
    fXl.Workbooks.Add(1, lcid);

    nf:=0;
    for C := 0 to cxCheckListFields.Items.Count - 1 do
     if cxCheckListFields.Checked[C] then Inc(nf);

    vData := VarArrayCreate([0, FDataSet.RecordCount, 1, nf ], varVariant);

    i:=1;
    for C := 0 to cxCheckListFields.Items.Count - 1 do
    begin
     if cxCheckListFields.Checked[C] then
     begin
      vData[0, i] := GetRusName(FDataSet.Fields[C].DisplayLabel);
      Inc(i);
     end;
    end;
    nRec:=FDataSet.RecNo;
    FDataSet.DisableControls;
    FDataSet.First;
    R := 1;
    while not FDataSet.Eof do begin
     C := 0;
     for i := 0 to FDataSet.FieldCount - 1 do
     begin
      if cxCheckListFields.Checked[i] then
      begin
       Inc(C);
       case FDataSet.Fields[i].DataType of ftString, ftFixedChar, ftWideString:
           vData[R, C] := #39 + FDataSet.Fields[i].Value;
         else vData[R, C] := FDataSet.Fields[i].Value;
       end;
      end;
     end;
     Inc(R);
     FDataSet.Next;
    end;
    ASheet := (fXL.ActiveWorkbook.ActiveSheet as _Worksheet);
    with ASheet do with Range['A1', Cells.Item[FDataSet.RecordCount + 1, nf]] do
     Formula := vData;
    fXL.UserControl := false;
    ASheet.SaveAs(SaveDialog1.FileName, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
    fXL.Quit;
    fXL.Disconnect;
    FreeAndNil(fXL);
    FDataSet.RecNo:=nRec;
    FDataSet.EnableControls;
  except on E : Exception
   do begin
     ShowMessage(E.Message);
     Close;
   end;
  end;
  CloseWaitWindow(w);
  Close;
end;

procedure TfmExport.FormCreate(Sender: TObject);
var
 C: integer;
begin
 Caption:=MAT_SYS_PREFIX+' :: '+MAT_ACTION_EXPORT_CONST;
 cxExport.Caption:=MAT_BUTTON_EXPORT_CONST;
 cxExit.Caption:=MAT_BUTTON_CANCEL_CONST;
 for C := 0 to FDataSet.FieldCount - 1 do
 begin
  cxCheckListFields.Items.Add(GetRusName(FDataSet.Fields[C].DisplayLabel));
 end;
 for C := 0 to FDataSet.FieldCount - 1 do
  cxCheckListFields.Checked[C]:=True;
end;

function GetRusName(EngName:string):string;
var Names:array of array of string;
    flag_search:Boolean;
    i,n:Integer;
begin
 n:=113;
 setlength(Names,2,n);
 Names[0,1]:='FIO_MOL';
 Names[1,1]:='МВО';
 Names[0,2]:='NAME_DEPARTMENT';
 Names[1,2]:='Підрозділ';
 Names[0,3]:='NAME_KART';
 Names[1,3]:='Назва';
 Names[0,4]:='NAME_SCH';
 Names[1,4]:='Назва рахунку';
 Names[0,5]:='GRP_NUM';
 Names[1,5]:='№ групи';
 Names[0,6]:='INV_NUM';
 Names[1,6]:='Інвентарний номер';
 Names[0,7]:='NUM_SCH';
 Names[1,7]:='Рахунок';
 Names[0,8]:='BAL_PRICE';
 Names[1,8]:='Балансова вартість';
 Names[0,9]:='OST_PRICE';
 Names[1,9]:='Залишкова вартість';
 Names[0,10]:='IZNOS';
 Names[1,10]:='Знос';
 Names[0,11]:='DOC_REC';
 Names[1,11]:='Поточний період';
 Names[0,12]:='WORKED';
 Names[1,12]:='WORKED';
 Names[0,13]:='TIP_KART';
 Names[1,13]:='Тип картки';
 Names[0,14]:='USE_IN_NALOG';
 Names[1,14]:='Ознака використання в податковому обліку';
 Names[0,15]:='KART_NUM';
 Names[1,15]:='№ картки';
 Names[0,16]:='DATE_EXPL';
 Names[1,16]:='Дата експлуатації';
 Names[0,17]:='DATE_OUT';
 Names[1,17]:='Дата списання (вибуття)';
 Names[0,18]:='DATE_OPR';
 Names[1,18]:='Дата оприбуткування';
 Names[0,19]:='DATE_UP';
 Names[1,19]:='Дата модернізації';
 Names[0,20]:='FULL_INV';
 Names[1,20]:='Інвентарний №';
 Names[0,21]:='IS_BUHG_ACC';
 Names[1,21]:='IS_BUHG_ACC';
 Names[0,22]:='BAL_SCH_NUMBER';
 Names[1,22]:='Балансовий рахунок';
 Names[0,23]:='BAL_SCH_TITLE';
 Names[1,23]:='Назва балансового рахунку';
 Names[0,24]:='CHEKER';
 Names[1,24]:='CHEKER';
 Names[0,25]:='IS_SKLAD';
 Names[1,25]:='IS_SKLAD';
 Names[0,26]:='IS_INV_OBJ';
 Names[1,26]:='IS_INV_OBJ';
 Names[0,27]:='FIO';
 Names[1,27]:='МВО';
 Names[0,28]:='SFIO';
 Names[1,28]:='МВО (скорочено)';
 Names[0,29]:='NOMN';
 Names[1,29]:='Номенклатурний №';
 Names[0,30]:='LINKTO';
 Names[1,30]:='LINKTO';
 Names[0,31]:='NAME';
 Names[1,31]:='Назва';
 Names[0,32]:='UNIT';
 Names[1,32]:='Од. виміру';
 Names[0,33]:='KOL_MAT';
 Names[1,33]:='Кількість';
 Names[0,34]:='PRICE';
 Names[1,34]:='Ціна';
 Names[0,35]:='SUMMA';
 Names[1,35]:='Сума';
 Names[0,36]:='SCH_NUMBER';
 Names[1,36]:='Рахунок';
 Names[0,37]:='NAME_SCH';
 Names[1,37]:='Назва рахунку';
 Names[0,38]:='DOC_TIPD';
 Names[1,38]:='Тип документу (скороченно)';
 Names[0,39]:='DOC_NAME_TIPD';
 Names[1,39]:='Тип документу';
 Names[0,40]:='DOC_NUM_DOC';
 Names[1,40]:='Номер документу';
 Names[0,41]:='DOC_DATE_DOC';
 Names[1,41]:='Дата документу';
 Names[0,42]:='DOC_OTIPD';
 Names[1,42]:='Тип документу';
 Names[0,43]:='DOC_NAME_OSN';
 Names[1,43]:='DOC_NAME_OSN';
 Names[0,44]:='DOC_OSN_NUM_DOC';
 Names[1,44]:='Номер документу-підстави';
 Names[0,45]:='DOC_OSN_DATE_DOC';
 Names[1,45]:='Дата документу-підстави';
 Names[0,46]:='DOC_FIO_MO_IN';
 Names[1,46]:='ПІБ МВО (кому)';
 Names[0,47]:='DOC_FIO_IN';
 Names[1,47]:='ПІБ МВО (кому) скорочено';
 Names[0,48]:='DOC_NAME_DEP_IN';
 Names[1,48]:='Назва підрозділу МВО (кому)';
 Names[0,49]:='DOC_FIO_MO_OUT';
 Names[1,49]:='ПІБ МВО (від кого)';
 Names[0,50]:='DOC_FIO_OUT';
 Names[1,50]:='ПІБ МВО (від кого) скорочено';
 Names[0,51]:='DOC_NAME_DEP_OUT';
 Names[1,51]:='Назва підрозділу МВО (від кого)';
 Names[0,52]:='DOC_NAME_CUSTOMER';
 Names[1,52]:='Назва контрагента';
 Names[0,53]:='DOC_SUMMA';
 Names[1,53]:='Сума (по документу)';
 Names[0,54]:='DOC_DATE_REC';
 Names[1,54]:='Період відпрацьовування';
 Names[0,55]:='INV_ACC';
 Names[1,55]:='Ид. властивості, що визначая інвентарний облік';
 Names[0,56]:='NAME_IN';
 Names[1,56]:='ПІБ (кому)';
 Names[0,57]:='NAME_OUT';
 Names[1,57]:='ПІБ (від кого)';
 Names[0,58]:='DOC_PERIOD';
 Names[1,58]:='Період';
 Names[0,59]:='CHECKED';
 Names[1,59]:='CHECKED';
 Names[0,60]:='KOD_SYSTEM';
 Names[1,60]:='Код системи';
 Names[0,61]:='KOL_DOC';
 Names[1,61]:='Загальна кількість за документом';
 Names[0,62]:='SUM_DOC';
 Names[1,62]:='Загальна сума за документом';
 Names[0,63]:='SCH_TITLE';
 Names[1,63]:='Назва рахунку';
 Names[0,64]:='GROUP_NAME';
 Names[1,64]:='Назва групи';
 Names[0,65]:='DB_SCH_NUMBER';
 Names[1,65]:='Номер дебетового рахунку';
 Names[0,66]:='DB_SCH_TITLE';
 Names[1,66]:='Назва дебетового рахунку';
 Names[0,67]:='NAME_GROUP4';
 Names[1,67]:='Назва групи 4-го рівня';
 Names[0,68]:='NAME_GROUP3';
 Names[1,68]:='Назва групи 3-го рівня';
 Names[0,69]:='NAME_GROUP2';
 Names[1,69]:='Назва групи 2-го рівня';
 Names[0,70]:='NAME_GROUP1';
 Names[1,70]:='Назва групи 1-го рівня';
 Names[0,71]:='NAME_GROUP1';
 Names[1,71]:='Назва групи 1-го рівня';
 Names[0,72]:='FIO_MO_IN';
 Names[1,72]:='ПІБ МВО (кому)';
 Names[0,73]:='SFIO_MO_IN';
 Names[1,73]:='ПІБ МВО (кому) скорочено';
 Names[0,74]:='DEP_MO_IN';
 Names[1,74]:='Підрозділ МВО (кому)';
 Names[0,75]:='FIO_MO_OUT';
 Names[1,75]:='ПІБ МВО (від кого)';
 Names[0,76]:='SFIO_MO_OUT';
 Names[1,76]:='ПІБ МВО (від кого) скорочено';
 Names[0,77]:='DEP_MO_OUT';
 Names[1,77]:='Підрозділ МВО (від кого)';
 Names[0,78]:='KR_SCH_NUMBER';
 Names[1,78]:='Номер кредитового рахунку';
 Names[0,79]:='KR_SCH_TITLE';
 Names[1,79]:='Назва кредитового рахунку';
 Names[0,80]:='DB_SM_TITLE';
 Names[1,80]:='Назва кошторису (деб.)';
 Names[0,81]:='KR_SM_TITLE';
 Names[1,81]:='Назва кошторису (кр.)';
 Names[0,82]:='DB_SM_KOD';
 Names[1,82]:='Код кошторису (деб.)';
 Names[0,83]:='KR_SM_KOD';
 Names[1,83]:='Код кошторису (кр.)';
 Names[0,84]:='DB_RZ_TITLE';
 Names[1,84]:='Назва розділу(деб.)';
 Names[0,85]:='DB_RZ_KOD';
 Names[1,85]:='Код розділу(деб.)';
 Names[0,86]:='KR_RZ_TITLE';
 Names[1,86]:='Назва розділу(кр.)';
 Names[0,87]:='KR_RZ_KOD';
 Names[1,87]:='Код розділу(кр.)';
 Names[0,88]:='DB_ST_TITLE';
 Names[1,88]:='Назва статті (деб.)';
 Names[0,89]:='DB_ST_KOD';
 Names[1,89]:='Код статті (деб.)';
 Names[0,90]:='KR_ST_TITLE';
 Names[1,90]:='Назва статті (кр.)';
 Names[0,91]:='KR_ST_KOD';
 Names[1,91]:='Код статті (кр.)';
 Names[0,92]:='DB_KEKV_TITLE';
 Names[1,92]:='Назва КЕКВ (деб.)';
 Names[0,93]:='DB_KEKV_KOD';
 Names[1,93]:='Код КЕКВ (деб.)';
 Names[0,94]:='KR_KEKV_TITLE';
 Names[1,94]:='Назва КЕКВ (кр.)';
 Names[0,95]:='KR_KEKV_KOD';
 Names[1,95]:='Код КЕКВ (кр.)';
 Names[0,96]:='SHORT_NAME';
 Names[1,96]:='Од.вим (скорочено)';
 Names[0,97]:='BAL_DB_SCH_NUMBER';
 Names[1,97]:='Номер балансового рахунку (деб.)';
 Names[0,98]:='BAL_DB_SCH_TITLE';
 Names[1,98]:='Назва балансового рахунку (деб.)';
 Names[0,99]:='BAL_KR_SCH_NUMBER';
 Names[1,99]:='Номер балансового рахунку (кр.)';
 Names[0,100]:='BAL_KR_SCH_TITLE';
 Names[1,100]:='Назва балансового рахунку (кр.)';
 Names[0,101]:='UNIT_NAME';
 Names[1,101]:='Од. виміру';
 Names[0,102]:='KOL_BEG';
 Names[1,102]:='KOL_BEG';
 Names[0,103]:='KOL_PRH';
 Names[1,103]:='KOL_PRH';
 Names[0,104]:='KOL_RSH';
 Names[1,104]:='KOL_RSH';
 Names[0,105]:='KOL_OST';
 Names[1,105]:='KOL_OST';
 Names[0,106]:='SUMM_BEG';
 Names[1,106]:='SUMM_BEG';
 Names[0,107]:='SUMM_PRH';
 Names[1,107]:='SUMM_PRH';
 Names[0,108]:='SUMM_RSH';
 Names[1,108]:='SUMM_RSH';
 Names[0,109]:='SUMM_OST';
 Names[1,109]:='SUMM_OST';
 Names[0,110]:='MARK';
 Names[1,110]:='MARK';
 Names[0,111]:='MNA_NUM_LIST';
 Names[1,111]:='MNA_NUM_LIST';
 Names[0,112]:='INV_NUM_LIST';
 Names[1,112]:='INV_NUM_LIST';
 i:=0;
 flag_search:=False;
 while ((i<n)and (flag_search=False)) do
  begin
    if EngName=Names[0,i] then flag_search:=True;
    i:=i+1;
  end;
  if flag_search=True then Result:=Names[1,i-1]
   else Result:=EngName;
end;


constructor TfmExport.Create(aOwner: TComponent; aDataSet: TpFIBDataSet);
begin
 inherited Create(aOwner);
 FDataSet:=aDataSet;
end;

procedure TfmExport.cxButtonAllClick(Sender: TObject);
var
  C: Integer;
begin
 for C := 0 to FDataSet.FieldCount - 1 do
  cxCheckListFields.Checked[C]:=True;
end;

procedure TfmExport.cxButtonNoneClick(Sender: TObject);
var
  C: Integer;
begin
 for C := 0 to FDataSet.FieldCount - 1 do
  cxCheckListFields.Checked[C]:=False;
end;

procedure TfmExport.cxButtonIDClick(Sender: TObject);
var
  C: Integer;
begin
 for C := 0 to FDataSet.FieldCount - 1 do
 begin
  if Pos('ID', cxCheckListFields.Items[C])>0 then
   cxCheckListFields.Checked[C]:=False;
 end;
end;

procedure TfmExport.acExitExecute(Sender: TObject);
begin
 Close;
end;

end.


