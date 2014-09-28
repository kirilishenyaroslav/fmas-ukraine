unit ACardPrintReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  frxClass, frxDBSet, cxLookAndFeelPainters, ExtCtrls, StdCtrls, cxButtons,
  cxDropDownEdit, cxFontNameComboBox, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel, cxPropertiesStore, Registry,
  ActnList, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxFilter, cxData, cxDataStorage,
  ComCtrls, ToolWin, ImgList, cxStyles,
  Ibase, cxCustomData, cxGraphics,
  cxGridBandedTableView,
  cxGridDBBandedTableView, cxCheckBox,
  cxExportGrid4Link, cxExport, Placemnt, cxCalc,
  Printers, Menus,dxStatusBar, frxExportPDF, frxExportImage, frxExportRTF,
  frxExportXML, frxExportXLS, frxExportHTML, frxExportTXT, frxDesgn;

type
    FieldInfo = record
      fieldname: string;
      caption: string;
      alignment: TAlignment;
      order: short;
      width: single;
      aggregative_function: string;
      bandTitle:String;
    end;

  TAcardPrintReportForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox4: TGroupBox;
    cxComboBox1: TcxComboBox;
    cxFontNameComboBox1: TcxFontNameComboBox;
    cxSpinEdit1: TcxSpinEdit;
    cxSpinEdit2: TcxSpinEdit;
    cxSpinEdit3: TcxSpinEdit;
    cxSpinEdit4: TcxSpinEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Panel1: TPanel;
    cxPropertiesStore1: TcxPropertiesStore;
    ActionList1: TActionList;
    Enter: TAction;
    Esc: TAction;
    frxDBDataset: TfrxDBDataset;
    frxDBDatasetV: TfrxDBDataset;
    frxTXTExport1: TfrxTXTExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    frxRTFExport1: TfrxRTFExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxTIFFExport1: TfrxTIFFExport;
    frxPDFExport1: TfrxPDFExport;
    frxDesigner1: TfrxDesigner;
    frxDBDatasetV2: TfrxDBDataset;
    frxReport: TfrxReport;
    procedure Panel1Click(Sender: TObject);
    procedure OnKeyPress(Sender: TObject; var Key: Char);
    procedure ReportCreate;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EnterExecute(Sender: TObject);
    procedure EscExecute(Sender: TObject);

  private
    procedure CreatePage1;
    procedure CreatePage2;

    procedure CreatePageF1;
    procedure CreatePageF2;

    procedure CreatePageKV1;

    procedure CreatePageNO1;

    procedure CreatePageAG1;
    procedure CreatePageAG2;

    procedure CreatePageUO1;
    procedure CreatePageUO2;

  public
      Margins: array of short;
      PageOrient: boolean;
      FontType: string;
      FontSize: short;
      FTypeForm:Integer;
      constructor Create(AOwner:TComponent; TypeForm:Integer);reintroduce;
  end;

implementation

uses UCardKassaRasx, ACardFactRasx, UKardKVMainForm, UKardNOMainForm, DateUtils,
UCardGetAssign, UCardGetUrO;

{$R *.dfm}

procedure TAcardPrintReportForm.FormCreate(Sender: TObject);
var
Reg:TRegistry;
begin
  PageOrient:=false;
  FontType:=cxFontNameComboBox1.FontName;
  cxFontNameComboBox1.FontName:='Times New Roman';

  Reg:=TRegistry.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
    try
      Reg.OpenKey  ('\Software\cxPropertiesStore',false);
      if Reg.ValueExists ('PageOrient')   then PageOrient:=Reg.ReadBool('PageOrient');
      if Reg.ValueExists ('PageFontName') then cxFontNameComboBox1.FontName:=Reg.ReadString('PageFontName');
      finally Reg.Free;
    End;
  if PageOrient then begin
    panel1.Caption:='Альбомна';
    panel1.Top:=181;
    panel1.Left:=51;
    panel1.Height:=70;
    panel1.Width:=96;
  end
  else begin
    panel1.Caption:='Портретна';
    panel1.Top:=168;
    panel1.Left:=64;
    panel1.Height:=96;
    panel1.Width:=70;
  end;
end;

procedure TAcardPrintReportForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Reg:TRegistry;
begin
  Reg:=TRegistry.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
    try
      Reg.OpenKey     ('\Software\cxPropertiesStore',true);
      Reg.WriteBool   ('PageOrient',PageOrient);
      Reg.WriteString ('PageFontName',cxFontNameComboBox1.FontName);
      finally Reg.Free;
    end;
end;

procedure TAcardPrintReportForm.cxButton2Click(Sender: TObject);
begin
  ModalResult:=mrcancel;
end;

procedure TAcardPrintReportForm.Panel1Click(Sender: TObject);
var
t: short;
begin
  if (not PageOrient) then begin
    PageOrient:=true;
    panel1.Caption:='Альбомна';
    panel1.Top:=181;
    panel1.Left:=51;
  end
  else begin
    PageOrient:=false;
    panel1.Caption:='Портретна';
    panel1.Top:=168;
    panel1.Left:=64;
  end;
  t:=panel1.Height;
  panel1.Height:=panel1.Width;
  panel1.Width:=t;
end;

procedure TAcardPrintReportForm.OnKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
    begin
      key := #0;
      beep;
    end;
end;

procedure TAcardPrintReportForm.cxButton1Click(Sender: TObject);
begin

  if Length(cxComboBox1.Text)>2 then begin
    FontSize:=12;
    cxComboBox1.Text:='12';
  end
  else FontSize:=strtoint(cxComboBox1.Text);
  if FontSize>72 then begin FontSize:=72; cxComboBox1.Text:='72'; end;
  if FontSize<5  then begin FontSize:=5;  cxComboBox1.Text:='5'; end;
  SetLength(Margins,4);
  if  (cxSpinEdit1.Value<1) or (cxSpinEdit1.Value>20) then begin
    ShowMessage('Відступ має бути більш ніж 0 та меньш ніж 20.');
    cxSpinEdit1.Value:=15;
    exit;
  end;
  if  (cxSpinEdit2.Value<1) or (cxSpinEdit2.Value>20) then begin
    ShowMessage('Відступ має бути більш ніж 0 та меньш ніж 20.');
    cxSpinEdit2.Value:=15;
    exit;
  end;
  if  (cxSpinEdit3.Value<1) or (cxSpinEdit3.Value>20) then begin
    ShowMessage('Відступ має бути більш ніж 0 та меньш ніж 20.');
    cxSpinEdit3.Value:=15;
    exit;
  end;
  if  (cxSpinEdit4.Value<1) or (cxSpinEdit4.Value>20) then begin
    ShowMessage('Відступ має бути більш ніж 0 та меньш ніж 20.');
    cxSpinEdit4.Value:=15;
    exit;
  end;
  Margins[0]:=cxSpinEdit2.Value;
  Margins[1]:=cxSpinEdit1.Value;
  Margins[2]:=cxSpinEdit4.Value;
  Margins[3]:=cxSpinEdit3.Value;
  FontType:=cxFontNameComboBox1.FontName;
  ReportCreate;
end;

procedure TAcardPrintReportForm.ReportCreate;
begin

  if (FTypeForm=1)
  then begin
            frxDBDataSet.DataSource:=TfrmGetKassaRasx(Self.Owner).PlanView.DataController.DataSource;
            frxDBDataSetV.DataSource:=TfrmGetKassaRasx(Self.Owner).VView.DataController.DataSource;

            frxReport.Clear;
            frxReport.DataSets.Add(frxDBDataSet);
            frxReport.DataSets.Add(frxDBDatasetV);

            CreatePage1;
            CreatePage2;
  end;

  if (FTypeForm=2)
  then begin
            frxDBDataSet.DataSource:=TfrmGetFactRsx(Self.Owner).PlanView.DataController.DataSource;
            frxDBDataSetV.DataSource:=TfrmGetFactRsx(Self.Owner).VView.DataController.DataSource;

            frxReport.Clear;
            frxReport.DataSets.Add(frxDBDataSet);
            frxReport.DataSets.Add(frxDBDatasetV);

            CreatePageF1;
            CreatePageF2;
  end;

  if (FTypeForm=3)
  then begin
            frxDBDataSet.DataSource:=TfrmKardKVMainForm(Self.Owner).PlanView.DataController.DataSource;

            frxReport.Clear;
            frxReport.DataSets.Add(frxDBDataSet);

            CreatePageKV1;
  end;

  if (FTypeForm=4)
  then begin
            frxDBDataSet.DataSource:=TfrmKardNOMainForm(Self.Owner).PlanView.DataController.DataSource;

            frxReport.Clear;
            frxReport.DataSets.Add(frxDBDataSet);

            CreatePageNO1;
  end;

  if (FTypeForm=5)
  then begin
            frxDBDataSet.DataSource:=TfrmGetAssignMain(Self.Owner).PlanView.DataController.DataSource;
            frxDBDataSetV2.DataSource:=TfrmGetAssignMain(Self.Owner).FactView.DataController.DataSource;

            frxReport.Clear;
            frxReport.DataSets.Add(frxDBDataSet);
            frxReport.DataSets.Add(frxDBDataSetV2);

            CreatePageAG1;
            CreatePageAG2;
  end;

  if (FTypeForm=6)
  then begin
            frxDBDataSet.DataSource:=TfrmGetUrOMain(Self.Owner).PlanView.DataController.DataSource;
            frxDBDataSetV2.DataSource:=TfrmGetUrOMain(Self.Owner).FactView.DataController.DataSource;

            frxReport.Clear;
            frxReport.DataSets.Add(frxDBDataSet);
            frxReport.DataSets.Add(frxDBDataSetV2);

            CreatePageUO1;
            CreatePageUO2;
  end;

  frxReport.ShowReport();
end;

procedure TAcardPrintReportForm.EnterExecute(Sender: TObject);
begin
  cxButton1Click(self);
end;

procedure TAcardPrintReportForm.EscExecute(Sender: TObject);
begin
  ModalResult:=mrcancel;
end;

procedure TAcardPrintReportForm.CreatePage1;
var
  n,m: short;
  FieldstoTable: array of FieldInfo;
  GroupFields: array of FieldInfo;
  Page: TfrxReportPage;
  RepSummary: TfrxReportSummary;
  DataBand: TfrxMasterData;
  Band: TfrxBand;
  PageHeader: TfrxPageHeader;
  Memo: TfrxMemoView;
  line: TfrxLineView;
  b1gh: TfrxGroupHeader;
  b1gf: TfrxGroupFooter;
  i,j,k,l,t,colwidth: short;
  gcolcount, colcount:Integer;
  pagewidth, sumwidth: extended;
  f: single;
  colswidth: array of short;
  tmp:FieldInfo;
  s:string;
begin
  Page := TfrxReportPage.Create(frxReport);
  Page.CreateUniqueName;
  Page.SetDefaults;
  if FontType<>'' then Page.Font.Name:=FontType;
  if FontSize<>0  then Page.Font.Size:=FontSize;
  Page.Orientation :=TPrinterOrientation(PageOrient);
  Page.LeftMargin  :=Margins[0];
  Page.TopMargin   :=Margins[1];
  Page.RightMargin :=Margins[2];
  Page.BottomMargin:=Margins[3];

  //Создаем бэнд заголовок отчета
  pagewidth:=Page.Width-3.85*(Margins[0]+Margins[2]);
  Band:=TfrxReportTitle.Create(Page);
  Band.CreateUniqueName;
  Band.Stretched:=true;
  Band.SetBounds(10,0,pagewidth,90);

  colcount:=0;
  gcolcount:=0;
  sumwidth:=0;
  for i:=0 to TfrmGetKassaRasx(Self.Owner).PlanView.ColumnCount-1 do
  begin
       if (TfrmGetKassaRasx(Self.Owner).PlanView.Columns[i].GroupIndex>-1)
       then begin
                 Inc(gcolcount);
                 sumwidth:=sumwidth+0;//TfrmGetKassaRasx(Self.Owner).PlanView.Columns[i].Width;
       end
       else begin
                 Inc(colcount);
                 sumwidth:=sumwidth+TfrmGetKassaRasx(Self.Owner).PlanView.Columns[i].Width;
       end;
  end;
  n:=gcolcount;
  m:=colcount;
  SetLength(colswidth,n+m);

  FieldstoTable:=nil;
  GroupFields  :=nil;

  SetLength(FieldstoTable,colcount);
  SetLength(GroupFields,gcolcount);

  colcount:=0;
  gcolcount:=0;

  for i:=0 to TfrmGetKassaRasx(Self.Owner).PlanView.ColumnCount-1 do
  begin
       if (TfrmGetKassaRasx(Self.Owner).PlanView.Columns[i].GroupIndex>-1)
       then begin
                  GroupFields[gcolcount].fieldname:=TfrmGetKassaRasx(Self.Owner).PlanView.Columns[i].DataBinding.FieldName;
                  GroupFields[gcolcount].caption:=TfrmGetKassaRasx(Self.Owner).PlanView.Columns[i].Caption;

                  GroupFields[gcolcount].alignment:=TcxTextEditProperties(TfrmGetKassaRasx(Self.Owner).PlanView.Columns[i].Properties).Alignment.Horz;
                  GroupFields[gcolcount].width:=0;//(TfrmGetKassaRasx(Self.Owner).PlanView.Columns[i].Width/sumwidth);
                  if (TfrmGetKassaRasx(Self.Owner).PlanView.Columns[i].SortOrder=soAscending)
                  then GroupFields[gcolcount].order:=1
                  else GroupFields[gcolcount].order:=0;

                  GroupFields[gcolcount].aggregative_function:='';

                  Inc(gcolcount);
       end
       else begin
                  FieldstoTable[colcount].fieldname:=TfrmGetKassaRasx(Self.Owner).PlanView.Columns[i].DataBinding.FieldName;
                  FieldstoTable[colcount].caption:=TfrmGetKassaRasx(Self.Owner).PlanView.Columns[i].Caption;
                  FieldstoTable[colcount].width:=(TfrmGetKassaRasx(Self.Owner).PlanView.Columns[i].Width/sumwidth);

                  FieldstoTable[colcount].alignment:=TcxTextEditProperties(TfrmGetKassaRasx(Self.Owner).PlanView.Columns[i].Properties).Alignment.Horz;

                  if (TfrmGetKassaRasx(Self.Owner).PlanView.Columns[i].SortOrder=soAscending)
                  then FieldstoTable[colcount].order:=1
                  else FieldstoTable[colcount].order:=0;

                  if (TfrmGetKassaRasx(Self.Owner).PlanView.Columns[i].Tag>0)
                  or (TfrmGetKassaRasx(Self.Owner).PlanView.Columns[i].DataBinding.FieldName='KASSA_SUMMA')
                  then FieldstoTable[colcount].aggregative_function:='SUM';

                  if (TfrmGetKassaRasx(Self.Owner).PlanView.Columns[i].DataBinding.FieldName='KASSA_SUMMA')
                  then FieldstoTable[colcount].order:=255
                  else FieldstoTable[colcount].order:=i;

                  Inc(colcount);
       end;
  end;

  //Сортируем массив колонок
  for i:=0 to m-1 do
  begin
       for j:=i+1 to m-1 do
       begin
            if (FieldstoTable[i].order>FieldstoTable[j].order)
            then begin
                      tmp.fieldname:=FieldstoTable[j].fieldname;
                      tmp.caption  :=FieldstoTable[j].caption;
                      tmp.alignment:=FieldstoTable[j].alignment;
                      tmp.width    :=FieldstoTable[j].width;
                      tmp.aggregative_function :=FieldstoTable[j].aggregative_function;
                      tmp.order    :=FieldstoTable[j].order;

                      FieldstoTable[j].fieldname:=FieldstoTable[i].fieldname;
                      FieldstoTable[j].caption  :=FieldstoTable[i].caption;
                      FieldstoTable[j].alignment:=FieldstoTable[i].alignment;
                      FieldstoTable[j].width    :=FieldstoTable[i].width;
                      FieldstoTable[j].aggregative_function:=FieldstoTable[i].aggregative_function;
                      FieldstoTable[j].order    :=FieldstoTable[i].order;

                      FieldstoTable[i].fieldname:=tmp.fieldname;
                      FieldstoTable[i].caption  :=tmp.caption;
                      FieldstoTable[i].alignment:=tmp.alignment;
                      FieldstoTable[i].width    :=tmp.width;
                      FieldstoTable[i].aggregative_function:=tmp.aggregative_function;
                      FieldstoTable[i].order    :=tmp.order;
            end;
       end;
  end;


  f:=0;
  k:=0;
  pagewidth:=Page.Width-3.85*(Margins[0]+Margins[2]);

  for i:=0 to n+m-1 do
  begin
       if (i>=n)
       then begin
                 if (FieldstoTable[i-n].width>0.0)
                 then begin
                        f:=f+FieldstoTable[i-n].width;
                        k:=k+1;
                 end;
       end
       else
           if (GroupFields[i].width>0.0)
           then begin
                     f:=f+GroupFields[i].width;
                     k:=k+1;
           end;
  end;

  if (f>1.01)
  then begin
            ShowMessage('wrong columns width'); exit;
  end;

  if (m+n)>k
  then begin
            colwidth:=trunc(pagewidth*(1-f)/(m+n-k));
            for i:=0 to n+m-1 do
            begin
                 if (i>=n)
                 then begin
                           if (FieldstoTable[i-n].width=0)
                           then colswidth[i]:=colwidth
                           else colswidth[i]:=trunc(FieldstoTable[i-n].width*pagewidth);
                 end
                 else begin
                           if GroupFields[i].width=0
                           then colswidth[i]:=colwidth
                           else colswidth[i]:=trunc(GroupFields[i].width*pagewidth);
                 end;
            end;
  end
  else begin
            for i:=0 to n+m-1
            do begin
                    if (i>=n)
                    then colswidth[i]:=trunc(FieldstoTable[i-n].width*pagewidth)
                    else colswidth[i]:=trunc(GroupFields[i].width*pagewidth);
            end;
  end;



  //Создаем мемо времени-даты на заголовке отчета
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Font.Size:=6;
  Memo.Text:='[<Date>]   [<Time>]';
  Memo.SetBounds(0,0,80,10);

  //Создаем ссылку на приказ
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='ЗАТВЕРДЖЕНО';
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haRight;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,10,pagewidth,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='наказом Державного казначейства України';
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haRight;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,20,pagewidth,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='від 6 жовтня 2000 р. № 100';
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haRight;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,30,pagewidth,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:=TfrmGetKassaRasx(Self.Owner).organization;
  Memo.Frame.Typ:=[ftBottom];
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[fsUnderline];
  Memo.SetBounds(0,40,200,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='(назва установи)';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,50,200,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='Ідентифікаційний код за ЄДРПОУ';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[fsBold];
  Memo.SetBounds(0,60,200,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.Frame.Typ:=[ftLeft, ftRight, ftBottom, ftTop];
  Memo.Text:=TfrmGetKassaRasx(Self.Owner).KOD_EDRPOU;
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,70,150,20);

  //Создаем мемо заголовка отчета
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='КАРТКА АНАЛІТИЧНОГО ОБЛІКУ КАСОВИХ ВИДАТКІВ';
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[fsbold];
  Memo.SetBounds(0,80+10,pagewidth,10);

  //Создаем мемо периода карточки на заголовке отчета
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='за '+ DateToStr(TfrmGetKassaRasx(Self.Owner).date_beg)+' - '+DateToStr(TfrmGetKassaRasx(Self.Owner).date_end);
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,80+30,pagewidth,10);

  //Создаем мемо Обслуживаемой организации
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='Організація, що обслуговується: '+TfrmGetKassaRasx(Self.Owner).organization;
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,80+40,pagewidth,10);

  //Создаем мемо КПК, тип коштів
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:=TfrmGetKassaRasx(Self.Owner).Label1.Caption;
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,80+50,pagewidth,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:=TfrmGetKassaRasx(Self.Owner).Label2.Caption;
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,80+60,pagewidth,10);

  TfrmGetKassaRasx(Self.Owner).SchDataSet.First;
  s:='';
  for t:=0 to TfrmGetKassaRasx(Self.Owner).SchDataSet.RecordCount-2 do
  begin
      s:=s+' '+ TfrmGetKassaRasx(Self.Owner).SchDataSet.FieldByName('sch_number').AsString+',';
      TfrmGetKassaRasx(Self.Owner).SchDataSet.Next;
  end;
  s:=s+' '+ TfrmGetKassaRasx(Self.Owner).SchDataSet.FieldByName('sch_number').AsString;


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='Видатки за кодами економічної класифікації'+#13+'за касовими рахунками: '+s;
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[fsbold];
  Memo.SetBounds(0,80+70,pagewidth,10);

  pagewidth:=0;
  for i:=0 to n+m-1 do pagewidth:=pagewidth+colswidth[i];

  PageHeader:=TfrxPageHeader.Create(Page);
  PageHeader.Top:=0;
  PageHeader.Stretched:=true;
  PageHeader.Height:=10;
  PageHeader.Stretched:=true;

  //Формируем заголовок таблицы
  l:=0;
  k:=Page.Font.Size;
  for j:=n to n+m-1 do
  begin
       Memo:=TfrxMemoView.Create(PageHeader);
       Memo.CreateUniqueName;
       Memo.StretchMode:=smMaxHeight;
       Memo.SetBounds(l,10,colswidth[j],25);
       l:=l+colswidth[j];
       Memo.Text:=FieldstoTable[j-n].caption;
       Memo.Font.Size:=k;
       Memo.Font.Style:=[fsBold];
       Memo.HAlign:=haCenter;
       Memo.VAlign:=TfrxVAlign(vaCenter);
       Memo.Frame.Style:=fsSolid;
       Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
  end;

  //Формируем группировку в таблице
  l:=0;i:=0;
  for j:=0 to n-1 do begin
    b1gh := TfrxGroupHeader.Create(Page);
    b1gh.CreateUniqueName;
    b1gh.Stretched:=true;
    b1gh.Condition:=frxDBDataSet.Name+'."'+GroupFields[j].fieldname+'"';
    b1gh.Top:=j*10;
    b1gh.Height:=10;

    Memo := TfrxMemoView.Create(b1gh);
    Memo.CreateUniqueName;
    Memo.StretchMode:=smMaxHeight;
    Memo.SetBounds(l, 0, trunc(pagewidth)-l, 10);
    Memo.Color:=RGB(235+j*2,235+j*2,170+(20-j*2)*j);

    Memo := TfrxMemoView.Create(b1gh);
    Memo.CreateUniqueName;
    Memo.StretchMode:=smMaxHeight;
    Memo.DataSet := frxDBDataSet;
    Memo.DataField := GroupFields[j].fieldname;
    Memo.SetBounds(l, 0, trunc(pagewidth)-l, 10);
    l:=l+colswidth[j];
    Memo.HAlign := haLeft;
    Memo.Frame.Typ:=[ftLeft, ftRight, ftTop];
    i:=0;
    for k:=0 to j do begin
      line:=TfrxLineView.Create(b1gh);
      line.StretchMode:=smMaxHeight;
      line.Left:=i;
      i:=i+colswidth[k];
      line.Top:=0;
      line.Height:=10;
      line.Width:=0;
    end;
  end;

  //Формируем саму таблицу
  DataBand := TfrxMasterData.Create(Page);
  DataBand.CreateUniqueName;
  DataBand.Stretched:=true;
  DataBand.DataSet := frxDBDataSet;
  DataBand.Top := n*10;
  DataBand.Height := 10;

  Memo := TfrxMemoView.Create(DataBand);
  Memo.CreateUniqueName;
  Memo.StretchMode:=smMaxHeight;
  Memo.Highlight.Condition:='<Line> mod 2 = 1';
  Memo.Highlight.Color:=RGB(245,245,245);
  Memo.SetBounds(l, 0, trunc(pagewidth)-l, 10);
  Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];

  l:=0;
  for j:=0 to m-1 do
  begin
          Memo := TfrxMemoView.Create(DataBand);
          Memo.CreateUniqueName;
          Memo.StretchMode:=smMaxHeight;
          Memo.DataSet := frxDBDataSet;
          Memo.DataField :=FieldstoTable[j].fieldname;
          Memo.SetBounds(i+l, 0, colswidth[j+n], 10);
          l:=l+colswidth[j+n];
          if FieldstoTable[j].alignment=taLeftJustify
          then Memo.HAlign := haLeft
          else if FieldstoTable[j].alignment=taRightJustify
               then Memo.HAlign := haRight
               else Memo.HAlign := haCenter;
          Memo.Frame.Typ:=[ftLeft];
  end;

  Band:=TfrxPageFooter.Create(Page);
  Band.CreateUniqueName;
  Band.SetBounds(0,0,pagewidth,20);

  Memo:=TfrxMemoView.Create(Band);
  Memo.Text:='[Page]';
  Memo.Font.Size:=12;
  Memo.HAlign:=haRight;
  Memo.SetBounds(pagewidth-40,0,40,20);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Font.Size:=6;
  Memo.Text:='[<Date>]  [<Time>]';
  Memo.SetBounds(0,10,80,10);



end;

procedure TAcardPrintReportForm.CreatePage2;
var
  n,m: short;
  FieldstoTable: array of FieldInfo;
  GroupFields: array of FieldInfo;
  Page: TfrxReportPage;
  RepSummary: TfrxReportSummary;
  DataBand: TfrxMasterData;
  Band: TfrxBand;
  PageHeader: TfrxPageHeader;
  Memo: TfrxMemoView;
  line: TfrxLineView;
  b1gh: TfrxGroupHeader;
  b1gf: TfrxGroupFooter;
  i,j,k,l,colwidth: short;
  gcolcount, colcount:Integer;
  pagewidth, sumwidth: extended;
  f: single;
  colswidth: array of short;
  tmp:FieldInfo;

begin
  Page := TfrxReportPage.Create(frxReport);
  Page.CreateUniqueName;
  Page.SetDefaults;
  if FontType<>'' then Page.Font.Name:=FontType;
  if FontSize<>0  then Page.Font.Size:=FontSize;
  Page.Orientation :=TPrinterOrientation(PageOrient);
  Page.LeftMargin  :=Margins[0];
  Page.TopMargin   :=Margins[1];
  Page.RightMargin :=Margins[2];
  Page.BottomMargin:=Margins[3];


  colcount:=0;
  gcolcount:=0;
  sumwidth:=0;
  for i:=0 to TfrmGetKassaRasx(Self.Owner).VView.ColumnCount-1 do
  begin
       if (TfrmGetKassaRasx(Self.Owner).VView.Columns[i].GroupIndex>-1)
       then begin
                 Inc(gcolcount);
                 sumwidth:=sumwidth+0;//TfrmGetKassaRasx(Self.Owner).PlanView.Columns[i].Width;
       end
       else begin
                 Inc(colcount);
                 sumwidth:=sumwidth+TfrmGetKassaRasx(Self.Owner).VView.Columns[i].Width;
       end;
  end;
  n:=gcolcount;
  m:=colcount;
  SetLength(colswidth,n+m);

  FieldstoTable:=nil;
  GroupFields  :=nil;

  SetLength(FieldstoTable,colcount);
  SetLength(GroupFields,gcolcount);

  colcount:=0;
  gcolcount:=0;

  for i:=0 to TfrmGetKassaRasx(Self.Owner).VView.ColumnCount-1 do
  begin
       if (TfrmGetKassaRasx(Self.Owner).VView.Columns[i].GroupIndex>-1)
       then begin
                  GroupFields[gcolcount].fieldname:=TfrmGetKassaRasx(Self.Owner).VView.Columns[i].DataBinding.FieldName;
                  GroupFields[gcolcount].caption:=TfrmGetKassaRasx(Self.Owner).VView.Columns[i].Caption;

                  GroupFields[gcolcount].alignment:=TcxTextEditProperties(TfrmGetKassaRasx(Self.Owner).VView.Columns[i].Properties).Alignment.Horz;
                  GroupFields[gcolcount].width:=0;//(TfrmGetKassaRasx(Self.Owner).PlanView.Columns[i].Width/sumwidth);
                  if (TfrmGetKassaRasx(Self.Owner).VView.Columns[i].SortOrder=soAscending)
                  then GroupFields[gcolcount].order:=1
                  else GroupFields[gcolcount].order:=0;

                  GroupFields[gcolcount].aggregative_function:='';

                  Inc(gcolcount);
       end
       else begin
                  FieldstoTable[colcount].fieldname:=TfrmGetKassaRasx(Self.Owner).VView.Columns[i].DataBinding.FieldName;
                  FieldstoTable[colcount].caption:=TfrmGetKassaRasx(Self.Owner).VView.Columns[i].Caption;
                  FieldstoTable[colcount].width:=(TfrmGetKassaRasx(Self.Owner).VView.Columns[i].Width/sumwidth);

                  FieldstoTable[colcount].alignment:=TcxTextEditProperties(TfrmGetKassaRasx(Self.Owner).VView.Columns[i].Properties).Alignment.Horz;

                  if (TfrmGetKassaRasx(Self.Owner).PlanView.Columns[i].SortOrder=soAscending)
                  then FieldstoTable[colcount].order:=1
                  else FieldstoTable[colcount].order:=0;

                  if (TfrmGetKassaRasx(Self.Owner).VView.Columns[i].Tag>0)
                  or (TfrmGetKassaRasx(Self.Owner).VView.Columns[i].DataBinding.FieldName='KASSA_SUMMA')
                  then FieldstoTable[colcount].aggregative_function:='SUM';

                  if (TfrmGetKassaRasx(Self.Owner).VView.Columns[i].DataBinding.FieldName='KASSA_SUMMA')
                  then FieldstoTable[colcount].order:=255
                  else FieldstoTable[colcount].order:=i;

                  Inc(colcount);
       end;
  end;

  //Сортируем массив колонок
  for i:=0 to m-1 do
  begin
       for j:=i+1 to m-1 do
       begin
            if (FieldstoTable[i].order>FieldstoTable[j].order)
            then begin
                      tmp.fieldname:=FieldstoTable[j].fieldname;
                      tmp.caption  :=FieldstoTable[j].caption;
                      tmp.alignment:=FieldstoTable[j].alignment;
                      tmp.width    :=FieldstoTable[j].width;
                      tmp.aggregative_function :=FieldstoTable[j].aggregative_function;
                      tmp.order    :=FieldstoTable[j].order;

                      FieldstoTable[j].fieldname:=FieldstoTable[i].fieldname;
                      FieldstoTable[j].caption  :=FieldstoTable[i].caption;
                      FieldstoTable[j].alignment:=FieldstoTable[i].alignment;
                      FieldstoTable[j].width    :=FieldstoTable[i].width;
                      FieldstoTable[j].aggregative_function:=FieldstoTable[i].aggregative_function;
                      FieldstoTable[j].order    :=FieldstoTable[i].order;

                      FieldstoTable[i].fieldname:=tmp.fieldname;
                      FieldstoTable[i].caption  :=tmp.caption;
                      FieldstoTable[i].alignment:=tmp.alignment;
                      FieldstoTable[i].width    :=tmp.width;
                      FieldstoTable[i].aggregative_function:=tmp.aggregative_function;
                      FieldstoTable[i].order    :=tmp.order;
            end;
       end;
  end;


  f:=0;
  k:=0;
  pagewidth:=Page.Width-3.85*(Margins[0]+Margins[2]);

  for i:=0 to n+m-1 do
  begin
       if (i>=n)
       then begin
                 if (FieldstoTable[i-n].width>0.0)
                 then begin
                        f:=f+FieldstoTable[i-n].width;
                        k:=k+1;
                 end;
       end
       else
           if (GroupFields[i].width>0.0)
           then begin
                     f:=f+GroupFields[i].width;
                     k:=k+1;
           end;
  end;

  if (f>1.01)
  then begin
            ShowMessage('wrong columns width'); exit;
  end;

  if (m+n)>k
  then begin
            colwidth:=trunc(pagewidth*(1-f)/(m+n-k));
            for i:=0 to n+m-1 do
            begin
                 if (i>=n)
                 then begin
                           if (FieldstoTable[i-n].width=0)
                           then colswidth[i]:=colwidth
                           else colswidth[i]:=trunc(FieldstoTable[i-n].width*pagewidth);
                 end
                 else begin
                           if GroupFields[i].width=0
                           then colswidth[i]:=colwidth
                           else colswidth[i]:=trunc(GroupFields[i].width*pagewidth);
                 end;
            end;
  end
  else begin
            for i:=0 to n+m-1
            do begin
                    if (i>=n)
                    then colswidth[i]:=trunc(FieldstoTable[i-n].width*pagewidth)
                    else colswidth[i]:=trunc(GroupFields[i].width*pagewidth);
            end;
  end;




  pagewidth:=0;
  for i:=0 to n+m-1 do pagewidth:=pagewidth+colswidth[i];

  PageHeader:=TfrxPageHeader.Create(Page);
  PageHeader.Top:=0;
  PageHeader.Stretched:=true;
  PageHeader.Height:=20;
  PageHeader.Stretched:=true;

  Memo:=TfrxMemoView.Create(PageHeader);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='Відшкодовано видатків за кодами економічної класифікації';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[fsbold];
  Memo.SetBounds(0,0,pagewidth,10);


  //Формируем заголовок таблицы
  l:=0;
  k:=Page.Font.Size;
  for j:=n to n+m-1 do
  begin
       Memo:=TfrxMemoView.Create(PageHeader);
       Memo.CreateUniqueName;
       Memo.StretchMode:=smMaxHeight;
       Memo.SetBounds(l,10,colswidth[j],25);
       l:=l+colswidth[j];
       Memo.Text:=FieldstoTable[j-n].caption;
       Memo.Font.Size:=k;
       Memo.Font.Style:=[fsBold];
       Memo.HAlign:=haCenter;
       Memo.VAlign:=TfrxVAlign(vaCenter);
       Memo.Frame.Style:=fsSolid;
       Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
  end;

  //Формируем группировку в таблице
  l:=0;i:=0;
  for j:=0 to n-1 do begin
    b1gh := TfrxGroupHeader.Create(Page);
    b1gh.CreateUniqueName;
    b1gh.Stretched:=true;
    b1gh.Condition:=frxDBDatasetV.Name+'."'+GroupFields[j].fieldname+'"';
    b1gh.Top:=j*10;
    b1gh.Height:=10;

    Memo := TfrxMemoView.Create(b1gh);
    Memo.CreateUniqueName;
    Memo.StretchMode:=smMaxHeight;
    Memo.SetBounds(l, 0, trunc(pagewidth)-l, 10);
    Memo.Color:=RGB(235+j*2,235+j*2,170+(20-j*2)*j);

    Memo := TfrxMemoView.Create(b1gh);
    Memo.CreateUniqueName;
    Memo.StretchMode:=smMaxHeight;
    Memo.DataSet := frxDBDatasetV;
    Memo.DataField := GroupFields[j].fieldname;
    Memo.SetBounds(l, 0, trunc(pagewidth)-l, 10);
    l:=l+colswidth[j];
    Memo.HAlign := haLeft;
    Memo.Frame.Typ:=[ftLeft, ftRight, ftTop];
    i:=0;
    for k:=0 to j do begin
      line:=TfrxLineView.Create(b1gh);
      line.StretchMode:=smMaxHeight;
      line.Left:=i;
      i:=i+colswidth[k];
      line.Top:=0;
      line.Height:=10;
      line.Width:=0;
    end;
  end;

  //Формируем саму таблицу
  DataBand := TfrxMasterData.Create(Page);
  DataBand.CreateUniqueName;
  DataBand.Stretched:=true;
  DataBand.DataSet := frxDBDataSetV;
  DataBand.Top := n*10;
  DataBand.Height := 10;

  Memo := TfrxMemoView.Create(DataBand);
  Memo.CreateUniqueName;
  Memo.StretchMode:=smMaxHeight;
  Memo.Highlight.Condition:='<Line> mod 2 = 1';
  Memo.Highlight.Color:=RGB(245,245,245);
  Memo.SetBounds(l, 0, trunc(pagewidth)-l, 10);
  Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];

  l:=0;
  for j:=0 to m-1 do
  begin
          Memo := TfrxMemoView.Create(DataBand);
          Memo.CreateUniqueName;
          Memo.StretchMode:=smMaxHeight;
          Memo.DataSet := frxDBDataSetV;
          Memo.DataField :=FieldstoTable[j].fieldname;
          Memo.SetBounds(i+l, 0, colswidth[j+n], 10);
          l:=l+colswidth[j+n];
          if FieldstoTable[j].alignment=taLeftJustify
          then Memo.HAlign := haLeft
          else if FieldstoTable[j].alignment=taRightJustify
               then Memo.HAlign := haRight
               else Memo.HAlign := haCenter;
          Memo.Frame.Typ:=[ftLeft];
  end;

  Band:=TfrxPageFooter.Create(Page);
  Band.CreateUniqueName;
  Band.SetBounds(0,0,pagewidth,20);

  Memo:=TfrxMemoView.Create(Band);
  Memo.Text:='[Page]';
  Memo.Font.Size:=12;
  Memo.HAlign:=haRight;
  Memo.SetBounds(pagewidth-40,0,40,20);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Font.Size:=6;
  Memo.Text:='[<Date>]  [<Time>]';
  Memo.SetBounds(0,10,80,10);


  Band:=TfrxReportSummary.Create(Page);
  Band.CreateUniqueName;
  Band.SetBounds(0,0,pagewidth,20);

  l:=50;
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='Виконавець:';
  Memo.Font.Size:=FontSize+2;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(l,50,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='________';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+100+20,50,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='(посада)';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+100+20,65,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='________';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+200+40,50,100,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='(підпис)';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+200+40,65,100,10);


  l:=400;
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='Перевірив:';
  Memo.Font.Size:=FontSize+2;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(l,50,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='________';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+100+20,50,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='(посада)';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+100+20,65,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='________';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+200+40,50,100,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='(підпис)';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+200+40,65,100,10);

end;

constructor TAcardPrintReportForm.Create(AOwner: TComponent;
  TypeForm: Integer);
begin
     inherited Create(AOwner);
     FTypeForm:=TypeForm;
end;

procedure TAcardPrintReportForm.CreatePageF1;
var
  n,m: short;
  FieldstoTable: array of FieldInfo;
  GroupFields: array of FieldInfo;
  Page: TfrxReportPage;
  RepSummary: TfrxReportSummary;
  DataBand: TfrxMasterData;
  Band: TfrxBand;
  PageHeader: TfrxPageHeader;
  Memo: TfrxMemoView;
  line: TfrxLineView;
  b1gh: TfrxGroupHeader;
  b1gf: TfrxGroupFooter;
  i,j,k,l,colwidth, t: short;
  gcolcount, colcount:Integer;
  pagewidth, sumwidth: extended;
  f: single;
  colswidth: array of short;
  tmp:FieldInfo;
  s:string;
begin
  Page := TfrxReportPage.Create(frxReport);
  Page.CreateUniqueName;
  Page.SetDefaults;
  if FontType<>'' then Page.Font.Name:=FontType;
  if FontSize<>0  then Page.Font.Size:=FontSize;
  Page.Orientation :=TPrinterOrientation(PageOrient);
  Page.LeftMargin  :=Margins[0];
  Page.TopMargin   :=Margins[1];
  Page.RightMargin :=Margins[2];
  Page.BottomMargin:=Margins[3];

  //Создаем бэнд заголовок отчета
  pagewidth:=Page.Width-3.85*(Margins[0]+Margins[2]);
  Band:=TfrxReportTitle.Create(Page);
  Band.CreateUniqueName;
  Band.Stretched:=true;
  Band.SetBounds(10,0,pagewidth,90);

  colcount:=0;
  gcolcount:=0;
  sumwidth:=0;
  for i:=0 to TfrmGetFactRsx(Self.Owner).PlanView.ColumnCount-1 do
  begin
       if (TfrmGetFactRsx(Self.Owner).PlanView.Columns[i].GroupIndex>-1)
       then begin
                 Inc(gcolcount);
                 sumwidth:=sumwidth+0;//TfrmGetKassaRasx(Self.Owner).PlanView.Columns[i].Width;
       end
       else begin
                 Inc(colcount);
                 sumwidth:=sumwidth+TfrmGetFactRsx(Self.Owner).PlanView.Columns[i].Width;
       end;
  end;
  n:=gcolcount;
  m:=colcount;
  SetLength(colswidth,n+m);

  FieldstoTable:=nil;
  GroupFields  :=nil;

  SetLength(FieldstoTable,colcount);
  SetLength(GroupFields,gcolcount);

  colcount:=0;
  gcolcount:=0;

  for i:=0 to TfrmGetFactRsx(Self.Owner).PlanView.ColumnCount-1 do
  begin
       if (TfrmGetFactRsx(Self.Owner).PlanView.Columns[i].GroupIndex>-1)
       then begin
                  GroupFields[gcolcount].fieldname:=TfrmGetFactRsx(Self.Owner).PlanView.Columns[i].DataBinding.FieldName;
                  GroupFields[gcolcount].caption:=TfrmGetFactRsx(Self.Owner).PlanView.Columns[i].Caption;

                  GroupFields[gcolcount].alignment:=TcxTextEditProperties(TfrmGetFactRsx(Self.Owner).PlanView.Columns[i].Properties).Alignment.Horz;
                  GroupFields[gcolcount].width:=0;//(TfrmGetKassaRasx(Self.Owner).PlanView.Columns[i].Width/sumwidth);
                  if (TfrmGetFactRsx(Self.Owner).PlanView.Columns[i].SortOrder=soAscending)
                  then GroupFields[gcolcount].order:=1
                  else GroupFields[gcolcount].order:=0;

                  GroupFields[gcolcount].aggregative_function:='';

                  Inc(gcolcount);
       end
       else begin
                  FieldstoTable[colcount].fieldname:=TfrmGetFactRsx(Self.Owner).PlanView.Columns[i].DataBinding.FieldName;
                  FieldstoTable[colcount].caption:=TfrmGetFactRsx(Self.Owner).PlanView.Columns[i].Caption;
                  FieldstoTable[colcount].width:=(TfrmGetFactRsx(Self.Owner).PlanView.Columns[i].Width/sumwidth);

                  FieldstoTable[colcount].alignment:=TcxTextEditProperties(TfrmGetFactRsx(Self.Owner).PlanView.Columns[i].Properties).Alignment.Horz;

                  if (TfrmGetFactRsx(Self.Owner).PlanView.Columns[i].SortOrder=soAscending)
                  then FieldstoTable[colcount].order:=1
                  else FieldstoTable[colcount].order:=0;

                  if (TfrmGetFactRsx(Self.Owner).PlanView.Columns[i].Tag>0)
                  or (TfrmGetFactRsx(Self.Owner).PlanView.Columns[i].DataBinding.FieldName='RASX_SUMMA')
                  then FieldstoTable[colcount].aggregative_function:='SUM';

                  if (TfrmGetFactRsx(Self.Owner).PlanView.Columns[i].DataBinding.FieldName='RASX_SUMMA')
                  then FieldstoTable[colcount].order:=255
                  else FieldstoTable[colcount].order:=i;

                  Inc(colcount);
       end;
  end;

  //Сортируем массив колонок
  for i:=0 to m-1 do
  begin
       for j:=i+1 to m-1 do
       begin
            if (FieldstoTable[i].order>FieldstoTable[j].order)
            then begin
                      tmp.fieldname:=FieldstoTable[j].fieldname;
                      tmp.caption  :=FieldstoTable[j].caption;
                      tmp.alignment:=FieldstoTable[j].alignment;
                      tmp.width    :=FieldstoTable[j].width;
                      tmp.aggregative_function :=FieldstoTable[j].aggregative_function;
                      tmp.order    :=FieldstoTable[j].order;

                      FieldstoTable[j].fieldname:=FieldstoTable[i].fieldname;
                      FieldstoTable[j].caption  :=FieldstoTable[i].caption;
                      FieldstoTable[j].alignment:=FieldstoTable[i].alignment;
                      FieldstoTable[j].width    :=FieldstoTable[i].width;
                      FieldstoTable[j].aggregative_function:=FieldstoTable[i].aggregative_function;
                      FieldstoTable[j].order    :=FieldstoTable[i].order;

                      FieldstoTable[i].fieldname:=tmp.fieldname;
                      FieldstoTable[i].caption  :=tmp.caption;
                      FieldstoTable[i].alignment:=tmp.alignment;
                      FieldstoTable[i].width    :=tmp.width;
                      FieldstoTable[i].aggregative_function:=tmp.aggregative_function;
                      FieldstoTable[i].order    :=tmp.order;
            end;
       end;
  end;


  f:=0;
  k:=0;
  pagewidth:=Page.Width-3.85*(Margins[0]+Margins[2]);

  for i:=0 to n+m-1 do
  begin
       if (i>=n)
       then begin
                 if (FieldstoTable[i-n].width>0.0)
                 then begin
                        f:=f+FieldstoTable[i-n].width;
                        k:=k+1;
                 end;
       end
       else
           if (GroupFields[i].width>0.0)
           then begin
                     f:=f+GroupFields[i].width;
                     k:=k+1;
           end;
  end;

  if (f>1.01)
  then begin
            ShowMessage('wrong columns width'); exit;
  end;

  if (m+n)>k
  then begin
            colwidth:=trunc(pagewidth*(1-f)/(m+n-k));
            for i:=0 to n+m-1 do
            begin
                 if (i>=n)
                 then begin
                           if (FieldstoTable[i-n].width=0)
                           then colswidth[i]:=colwidth
                           else colswidth[i]:=trunc(FieldstoTable[i-n].width*pagewidth);
                 end
                 else begin
                           if GroupFields[i].width=0
                           then colswidth[i]:=colwidth
                           else colswidth[i]:=trunc(GroupFields[i].width*pagewidth);
                 end;
            end;
  end
  else begin
            for i:=0 to n+m-1
            do begin
                    if (i>=n)
                    then colswidth[i]:=trunc(FieldstoTable[i-n].width*pagewidth)
                    else colswidth[i]:=trunc(GroupFields[i].width*pagewidth);
            end;
  end;



  //Создаем мемо времени-даты на заголовке отчета
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Font.Size:=6;
  Memo.Text:='[<Date>]   [<Time>]';
  Memo.SetBounds(0,0,80,10);


  //Создаем ссылку на приказ
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='ЗАТВЕРДЖЕНО';
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haRight;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,10,pagewidth,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='наказом Державного казначейства України';
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haRight;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,20,pagewidth,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='від 6 жовтня 2000 р. № 100';
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haRight;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,30,pagewidth,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:=TfrmGetFactRsx(Self.Owner).organixation;
  Memo.Frame.Typ:=[ftBottom];
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[fsUnderline];
  Memo.SetBounds(0,40,200,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='(назва установи)';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,50,200,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='Ідентифікаційний код за ЄДРПОУ';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[fsBold];
  Memo.SetBounds(0,60,200,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.Frame.Typ:=[ftLeft, ftRight, ftBottom, ftTop];
  Memo.Text:=TfrmGetFactRsx(Self.Owner).KOD_EDRPOU;
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,70,150,20);


  //Создаем мемо заголовка отчета
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='КАРТКА АНАЛІТИЧНОГО ОБЛІКУ ФАКТИЧНИХ ВИДАТКІВ';
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[fsbold];
  Memo.SetBounds(0,80+10,pagewidth,10);

  //Создаем мемо периода карточки на заголовке отчета
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='за '+ DateToStr(TfrmGetFactRsx(Self.Owner).date_beg)+' - '+DateToStr(TfrmGetFactRsx(Self.Owner).date_end);
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,80+30,pagewidth,10);

  //Создаем мемо Обслуживаемой организации
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='Організація, що обслуговується: '+TfrmGetFactRsx(Self.Owner).organixation;
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,80+40,pagewidth,10);

  //Создаем мемо КПК, тип коштів
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:=TfrmGetFactRsx(Self.Owner).Label1.Caption;
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,80+50,pagewidth,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:=TfrmGetFactRsx(Self.Owner).Label2.Caption;
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,80+60,pagewidth,10);

  TfrmGetFactRsx(Self.Owner).SchFDataSet.First;
  s:='';
  for t:=0 to TfrmGetFactRsx(Self.Owner).SchFDataSet.RecordCount-2 do
  begin
      s:=s+' '+ TfrmGetFactRsx(Self.Owner).SchFDataSet.FieldByName('sch_number').AsString+',';
      TfrmGetFactRsx(Self.Owner).SchFDataSet.Next;
  end;
  s:=s+' '+ TfrmGetFactRsx(Self.Owner).SchFDataSet.FieldByName('sch_number').AsString;


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='Дебет субрахунку :'+s;
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[fsbold];
  Memo.SetBounds(0,80+70,pagewidth,10);

  pagewidth:=0;
  for i:=0 to n+m-1 do pagewidth:=pagewidth+colswidth[i];

  PageHeader:=TfrxPageHeader.Create(Page);
  PageHeader.Top:=0;
  PageHeader.Stretched:=true;
  PageHeader.Height:=10;
  PageHeader.Stretched:=true;

  //Формируем заголовок таблицы
  l:=0;
  k:=Page.Font.Size;
  for j:=n to n+m-1 do
  begin
       Memo:=TfrxMemoView.Create(PageHeader);
       Memo.CreateUniqueName;
       Memo.StretchMode:=smMaxHeight;
       Memo.SetBounds(l,10,colswidth[j],25);
       l:=l+colswidth[j];
       Memo.Text:=FieldstoTable[j-n].caption;
       Memo.Font.Size:=k;
       Memo.Font.Style:=[fsBold];
       Memo.HAlign:=haCenter;
       Memo.VAlign:=TfrxVAlign(vaCenter);
       Memo.Frame.Style:=fsSolid;
       Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
  end;

  //Формируем группировку в таблице
  l:=0;i:=0;
  for j:=0 to n-1 do begin
    b1gh := TfrxGroupHeader.Create(Page);
    b1gh.CreateUniqueName;
    b1gh.Stretched:=true;
    b1gh.Condition:=frxDBDataSet.Name+'."'+GroupFields[j].fieldname+'"';
    b1gh.Top:=j*10;
    b1gh.Height:=10;

    Memo := TfrxMemoView.Create(b1gh);
    Memo.CreateUniqueName;
    Memo.StretchMode:=smMaxHeight;
    Memo.SetBounds(l, 0, trunc(pagewidth)-l, 10);
    Memo.Color:=RGB(235+j*2,235+j*2,170+(20-j*2)*j);

    Memo := TfrxMemoView.Create(b1gh);
    Memo.CreateUniqueName;
    Memo.StretchMode:=smMaxHeight;
    Memo.DataSet := frxDBDataSet;
    Memo.DataField := GroupFields[j].fieldname;
    Memo.SetBounds(l, 0, trunc(pagewidth)-l, 10);
    l:=l+colswidth[j];
    Memo.HAlign := haLeft;
    Memo.Frame.Typ:=[ftLeft, ftRight, ftTop];
    i:=0;
    for k:=0 to j do begin
      line:=TfrxLineView.Create(b1gh);
      line.StretchMode:=smMaxHeight;
      line.Left:=i;
      i:=i+colswidth[k];
      line.Top:=0;
      line.Height:=10;
      line.Width:=0;
    end;
  end;

  //Формируем саму таблицу
  DataBand := TfrxMasterData.Create(Page);
  DataBand.CreateUniqueName;
  DataBand.Stretched:=true;
  DataBand.DataSet := frxDBDataSet;
  DataBand.Top := n*10;
  DataBand.Height := 10;

  Memo := TfrxMemoView.Create(DataBand);
  Memo.CreateUniqueName;
  Memo.StretchMode:=smMaxHeight;
  Memo.Highlight.Condition:='<Line> mod 2 = 1';
  Memo.Highlight.Color:=RGB(245,245,245);
  Memo.SetBounds(l, 0, trunc(pagewidth)-l, 10);
  Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];

  l:=0;
  for j:=0 to m-1 do
  begin
          Memo := TfrxMemoView.Create(DataBand);
          Memo.CreateUniqueName;
          Memo.StretchMode:=smMaxHeight;
          Memo.DataSet := frxDBDataSet;
          Memo.DataField :=FieldstoTable[j].fieldname;
          Memo.SetBounds(i+l, 0, colswidth[j+n], 10);
          l:=l+colswidth[j+n];
          if FieldstoTable[j].alignment=taLeftJustify
          then Memo.HAlign := haLeft
          else if FieldstoTable[j].alignment=taRightJustify
               then Memo.HAlign := haRight
               else Memo.HAlign := haCenter;
          Memo.Frame.Typ:=[ftLeft];
  end;

  Band:=TfrxPageFooter.Create(Page);
  Band.CreateUniqueName;
  Band.SetBounds(0,0,pagewidth,20);

  Memo:=TfrxMemoView.Create(Band);
  Memo.Text:='[Page]';
  Memo.Font.Size:=12;
  Memo.HAlign:=haRight;
  Memo.SetBounds(pagewidth-40,0,40,20);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Font.Size:=6;
  Memo.Text:='[<Date>]  [<Time>]';
  Memo.SetBounds(0,10,80,10);
end;




procedure TAcardPrintReportForm.CreatePageF2;
var
  n,m: short;
  FieldstoTable: array of FieldInfo;
  GroupFields: array of FieldInfo;
  Page: TfrxReportPage;
  RepSummary: TfrxReportSummary;
  DataBand: TfrxMasterData;
  Band: TfrxBand;
  PageHeader: TfrxPageHeader;
  Memo: TfrxMemoView;
  line: TfrxLineView;
  b1gh: TfrxGroupHeader;
  b1gf: TfrxGroupFooter;
  i,j,k,l,colwidth: short;
  gcolcount, colcount:Integer;
  pagewidth, sumwidth: extended;
  f: single;
  colswidth: array of short;
  tmp:FieldInfo;

begin
  Page := TfrxReportPage.Create(frxReport);
  Page.CreateUniqueName;
  Page.SetDefaults;
  if FontType<>'' then Page.Font.Name:=FontType;
  if FontSize<>0  then Page.Font.Size:=FontSize;
  Page.Orientation :=TPrinterOrientation(PageOrient);
  Page.LeftMargin  :=Margins[0];
  Page.TopMargin   :=Margins[1];
  Page.RightMargin :=Margins[2];
  Page.BottomMargin:=Margins[3];


  colcount:=0;
  gcolcount:=0;
  sumwidth:=0;
  for i:=0 to TfrmGetFactRsx(Self.Owner).VView.ColumnCount-1 do
  begin
       if (TfrmGetFactRsx(Self.Owner).VView.Columns[i].GroupIndex>-1)
       then begin
                 Inc(gcolcount);
                 sumwidth:=sumwidth+0;//TfrmGetKassaRasx(Self.Owner).PlanView.Columns[i].Width;
       end
       else begin
                 Inc(colcount);
                 sumwidth:=sumwidth+TfrmGetFactRsx(Self.Owner).VView.Columns[i].Width;
       end;
  end;
  n:=gcolcount;
  m:=colcount;
  SetLength(colswidth,n+m);

  FieldstoTable:=nil;
  GroupFields  :=nil;

  SetLength(FieldstoTable,colcount);
  SetLength(GroupFields,gcolcount);

  colcount:=0;
  gcolcount:=0;

  for i:=0 to TfrmGetFactRsx(Self.Owner).VView.ColumnCount-1 do
  begin
       if (TfrmGetFactRsx(Self.Owner).VView.Columns[i].GroupIndex>-1)
       then begin
                  GroupFields[gcolcount].fieldname:=TfrmGetFactRsx(Self.Owner).VView.Columns[i].DataBinding.FieldName;
                  GroupFields[gcolcount].caption:=TfrmGetFactRsx(Self.Owner).VView.Columns[i].Caption;

                  GroupFields[gcolcount].alignment:=TcxTextEditProperties(TfrmGetFactRsx(Self.Owner).VView.Columns[i].Properties).Alignment.Horz;
                  GroupFields[gcolcount].width:=0;//(TfrmGetKassaRasx(Self.Owner).PlanView.Columns[i].Width/sumwidth);
                  if (TfrmGetFactRsx(Self.Owner).VView.Columns[i].SortOrder=soAscending)
                  then GroupFields[gcolcount].order:=1
                  else GroupFields[gcolcount].order:=0;

                  GroupFields[gcolcount].aggregative_function:='';

                  Inc(gcolcount);
       end
       else begin
                  FieldstoTable[colcount].fieldname:=TfrmGetFactRsx(Self.Owner).VView.Columns[i].DataBinding.FieldName;
                  FieldstoTable[colcount].caption:=TfrmGetFactRsx(Self.Owner).VView.Columns[i].Caption;
                  FieldstoTable[colcount].width:=(TfrmGetFactRsx(Self.Owner).VView.Columns[i].Width/sumwidth);

                  FieldstoTable[colcount].alignment:=TcxTextEditProperties(TfrmGetFactRsx(Self.Owner).VView.Columns[i].Properties).Alignment.Horz;

                  if (TfrmGetFactRsx(Self.Owner).PlanView.Columns[i].SortOrder=soAscending)
                  then FieldstoTable[colcount].order:=1
                  else FieldstoTable[colcount].order:=0;

                  if (TfrmGetFactRsx(Self.Owner).VView.Columns[i].Tag>0)
                  or (TfrmGetFactRsx(Self.Owner).VView.Columns[i].DataBinding.FieldName='RASX_SUMMA')
                  then FieldstoTable[colcount].aggregative_function:='SUM';

                  if (TfrmGetFactRsx(Self.Owner).VView.Columns[i].DataBinding.FieldName='RASX_SUMMA')
                  then FieldstoTable[colcount].order:=255
                  else FieldstoTable[colcount].order:=i;

                  Inc(colcount);
       end;
  end;

  //Сортируем массив колонок
  for i:=0 to m-1 do
  begin
       for j:=i+1 to m-1 do
       begin
            if (FieldstoTable[i].order>FieldstoTable[j].order)
            then begin
                      tmp.fieldname:=FieldstoTable[j].fieldname;
                      tmp.caption  :=FieldstoTable[j].caption;
                      tmp.alignment:=FieldstoTable[j].alignment;
                      tmp.width    :=FieldstoTable[j].width;
                      tmp.aggregative_function :=FieldstoTable[j].aggregative_function;
                      tmp.order    :=FieldstoTable[j].order;

                      FieldstoTable[j].fieldname:=FieldstoTable[i].fieldname;
                      FieldstoTable[j].caption  :=FieldstoTable[i].caption;
                      FieldstoTable[j].alignment:=FieldstoTable[i].alignment;
                      FieldstoTable[j].width    :=FieldstoTable[i].width;
                      FieldstoTable[j].aggregative_function:=FieldstoTable[i].aggregative_function;
                      FieldstoTable[j].order    :=FieldstoTable[i].order;

                      FieldstoTable[i].fieldname:=tmp.fieldname;
                      FieldstoTable[i].caption  :=tmp.caption;
                      FieldstoTable[i].alignment:=tmp.alignment;
                      FieldstoTable[i].width    :=tmp.width;
                      FieldstoTable[i].aggregative_function:=tmp.aggregative_function;
                      FieldstoTable[i].order    :=tmp.order;
            end;
       end;
  end;


  f:=0;
  k:=0;
  pagewidth:=Page.Width-3.85*(Margins[0]+Margins[2]);

  for i:=0 to n+m-1 do
  begin
       if (i>=n)
       then begin
                 if (FieldstoTable[i-n].width>0.0)
                 then begin
                        f:=f+FieldstoTable[i-n].width;
                        k:=k+1;
                 end;
       end
       else
           if (GroupFields[i].width>0.0)
           then begin
                     f:=f+GroupFields[i].width;
                     k:=k+1;
           end;
  end;

  if (f>1.01)
  then begin
            ShowMessage('wrong columns width'); exit;
  end;

  if (m+n)>k
  then begin
            colwidth:=trunc(pagewidth*(1-f)/(m+n-k));
            for i:=0 to n+m-1 do
            begin
                 if (i>=n)
                 then begin
                           if (FieldstoTable[i-n].width=0)
                           then colswidth[i]:=colwidth
                           else colswidth[i]:=trunc(FieldstoTable[i-n].width*pagewidth);
                 end
                 else begin
                           if GroupFields[i].width=0
                           then colswidth[i]:=colwidth
                           else colswidth[i]:=trunc(GroupFields[i].width*pagewidth);
                 end;
            end;
  end
  else begin
            for i:=0 to n+m-1
            do begin
                    if (i>=n)
                    then colswidth[i]:=trunc(FieldstoTable[i-n].width*pagewidth)
                    else colswidth[i]:=trunc(GroupFields[i].width*pagewidth);
            end;
  end;




  pagewidth:=0;
  for i:=0 to n+m-1 do pagewidth:=pagewidth+colswidth[i];

  PageHeader:=TfrxPageHeader.Create(Page);
  PageHeader.Top:=0;
  PageHeader.Stretched:=true;
  PageHeader.Height:=20;
  PageHeader.Stretched:=true;

  Memo:=TfrxMemoView.Create(PageHeader);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='Відшкодовано видатків за кодами економічної класифікації';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[fsbold];
  Memo.SetBounds(0,0,pagewidth,10);


  //Формируем заголовок таблицы
  l:=0;
  k:=Page.Font.Size;
  for j:=n to n+m-1 do
  begin
       Memo:=TfrxMemoView.Create(PageHeader);
       Memo.CreateUniqueName;
       Memo.StretchMode:=smMaxHeight;
       Memo.SetBounds(l,10,colswidth[j],25);
       l:=l+colswidth[j];
       Memo.Text:=FieldstoTable[j-n].caption;
       Memo.Font.Size:=k;
       Memo.Font.Style:=[fsBold];
       Memo.HAlign:=haCenter;
       Memo.VAlign:=TfrxVAlign(vaCenter);
       Memo.Frame.Style:=fsSolid;
       Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
  end;

  //Формируем группировку в таблице
  l:=0;i:=0;
  for j:=0 to n-1 do begin
    b1gh := TfrxGroupHeader.Create(Page);
    b1gh.CreateUniqueName;
    b1gh.Stretched:=true;
    b1gh.Condition:=frxDBDatasetV.Name+'."'+GroupFields[j].fieldname+'"';
    b1gh.Top:=j*10;
    b1gh.Height:=10;

    Memo := TfrxMemoView.Create(b1gh);
    Memo.CreateUniqueName;
    Memo.StretchMode:=smMaxHeight;
    Memo.SetBounds(l, 0, trunc(pagewidth)-l, 10);
    Memo.Color:=RGB(235+j*2,235+j*2,170+(20-j*2)*j);

    Memo := TfrxMemoView.Create(b1gh);
    Memo.CreateUniqueName;
    Memo.StretchMode:=smMaxHeight;
    Memo.DataSet := frxDBDatasetV;
    Memo.DataField := GroupFields[j].fieldname;
    Memo.SetBounds(l, 0, trunc(pagewidth)-l, 10);
    l:=l+colswidth[j];
    Memo.HAlign := haLeft;
    Memo.Frame.Typ:=[ftLeft, ftRight, ftTop];
    i:=0;
    for k:=0 to j do begin
      line:=TfrxLineView.Create(b1gh);
      line.StretchMode:=smMaxHeight;
      line.Left:=i;
      i:=i+colswidth[k];
      line.Top:=0;
      line.Height:=10;
      line.Width:=0;
    end;
  end;

  //Формируем саму таблицу
  DataBand := TfrxMasterData.Create(Page);
  DataBand.CreateUniqueName;
  DataBand.Stretched:=true;
  DataBand.DataSet := frxDBDataSetV;
  DataBand.Top := n*10;
  DataBand.Height := 10;

  Memo := TfrxMemoView.Create(DataBand);
  Memo.CreateUniqueName;
  Memo.StretchMode:=smMaxHeight;
  Memo.Highlight.Condition:='<Line> mod 2 = 1';
  Memo.Highlight.Color:=RGB(245,245,245);
  Memo.SetBounds(l, 0, trunc(pagewidth)-l, 10);
  Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];

  l:=0;
  for j:=0 to m-1 do
  begin
          Memo := TfrxMemoView.Create(DataBand);
          Memo.CreateUniqueName;
          Memo.StretchMode:=smMaxHeight;
          Memo.DataSet := frxDBDataSetV;
          Memo.DataField :=FieldstoTable[j].fieldname;
          Memo.SetBounds(i+l, 0, colswidth[j+n], 10);
          l:=l+colswidth[j+n];
          if FieldstoTable[j].alignment=taLeftJustify
          then Memo.HAlign := haLeft
          else if FieldstoTable[j].alignment=taRightJustify
               then Memo.HAlign := haRight
               else Memo.HAlign := haCenter;
          Memo.Frame.Typ:=[ftLeft];
  end;

  Band:=TfrxPageFooter.Create(Page);
  Band.CreateUniqueName;
  Band.SetBounds(0,0,pagewidth,20);

  Memo:=TfrxMemoView.Create(Band);
  Memo.Text:='[Page]';
  Memo.Font.Size:=12;
  Memo.HAlign:=haRight;
  Memo.SetBounds(pagewidth-40,0,40,20);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Font.Size:=6;
  Memo.Text:='[<Date>]  [<Time>]';
  Memo.SetBounds(0,10,80,10);

  Band:=TfrxReportSummary.Create(Page);
  Band.CreateUniqueName;
  Band.SetBounds(0,0,pagewidth,20);

  l:=50;
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='Виконавець:';
  Memo.Font.Size:=FontSize+2;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(l,50,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='________';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+100+20,50,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='(посада)';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+100+20,65,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='________';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+200+40,50,100,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='(підпис)';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+200+40,65,100,10);


  l:=400;
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='Перевірив:';
  Memo.Font.Size:=FontSize+2;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(l,50,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='________';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+100+20,50,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='(посада)';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+100+20,65,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='________';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+200+40,50,100,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='(підпис)';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+200+40,65,100,10);


end;

procedure TAcardPrintReportForm.CreatePageKV1;
var
  n,m: short;
  FieldstoTable: array of FieldInfo;
  GroupFields: array of FieldInfo;
  Page: TfrxReportPage;
  RepSummary: TfrxReportSummary;
  DataBand: TfrxMasterData;
  Band: TfrxBand;
  PageHeader: TfrxPageHeader;
  Memo: TfrxMemoView;
  line: TfrxLineView;
  b1gh: TfrxGroupHeader;
  b1gf: TfrxGroupFooter;
  i,j,k,l,colwidth, t: short;
  gcolcount, colcount:Integer;
  pagewidth, sumwidth: extended;
  f: single;
  colswidth: array of short;
  tmp:FieldInfo;
  first_flag, last_flag:boolean;
  le,we:short;
  s:string;
begin
  Page := TfrxReportPage.Create(frxReport);
  Page.CreateUniqueName;
  Page.SetDefaults;
  if FontType<>'' then Page.Font.Name:=FontType;
  if FontSize<>0  then Page.Font.Size:=FontSize;
  Page.Orientation :=TPrinterOrientation(PageOrient);
  Page.LeftMargin  :=Margins[0];
  Page.TopMargin   :=Margins[1];
  Page.RightMargin :=Margins[2];
  Page.BottomMargin:=Margins[3];

  //Создаем бэнд заголовок отчета
  pagewidth:=Page.Width-3.85*(Margins[0]+Margins[2]);
  Band:=TfrxReportTitle.Create(Page);
  Band.CreateUniqueName;
  Band.Stretched:=true;
  Band.SetBounds(10,0,pagewidth,90);

  colcount:=0;
  gcolcount:=0;
  sumwidth:=0;
  for i:=0 to TfrmKardKVMainForm(Self.Owner).PlanView.ColumnCount-1 do
  begin
       if (TfrmKardKVMainForm(Self.Owner).PlanView.Columns[i].GroupIndex>-1)
       then begin
                 Inc(gcolcount);
                 sumwidth:=sumwidth+0;
       end
       else begin
                 if TfrmKardKVMainForm(Self.Owner).PlanView.Columns[i].Visible
                 then begin
                           Inc(colcount);
                           sumwidth:=sumwidth+TfrmKardKVMainForm(Self.Owner).PlanView.Columns[i].Width;
                 end;
       end;
  end;
  n:=gcolcount;
  m:=colcount;
  SetLength(colswidth,n+m);

  FieldstoTable:=nil;
  GroupFields  :=nil;

  SetLength(FieldstoTable,colcount);
  SetLength(GroupFields,gcolcount);

  colcount:=0;
  gcolcount:=0;

  for i:=0 to TfrmKardKVMainForm(Self.Owner).PlanView.ColumnCount-1 do
  begin
       if (TfrmKardKVMainForm(Self.Owner).PlanView.Columns[i].GroupIndex>-1)
       then begin
                  GroupFields[gcolcount].fieldname:=TfrmKardKVMainForm(Self.Owner).PlanView.Columns[i].DataBinding.FieldName;
                  GroupFields[gcolcount].caption:=TfrmKardKVMainForm(Self.Owner).PlanView.Columns[i].Caption;

                  GroupFields[gcolcount].alignment:=TcxTextEditProperties(TfrmKardKVMainForm(Self.Owner).PlanView.Columns[i].Properties).Alignment.Horz;
                  GroupFields[gcolcount].width:=0;//(TfrmGetKassaRasx(Self.Owner).PlanView.Columns[i].Width/sumwidth);
                  if (TfrmKardKVMainForm(Self.Owner).PlanView.Columns[i].SortOrder=soAscending)
                  then GroupFields[gcolcount].order:=1
                  else GroupFields[gcolcount].order:=0;

                  GroupFields[gcolcount].aggregative_function:='';

                  Inc(gcolcount);
       end
       else begin
                  if TfrmKardKVMainForm(Self.Owner).PlanView.Columns[i].Visible
                  then begin
                            FieldstoTable[colcount].fieldname :=TfrmKardKVMainForm(Self.Owner).PlanView.Columns[i].DataBinding.FieldName;
                            FieldstoTable[colcount].caption   :=TfrmKardKVMainForm(Self.Owner).PlanView.Columns[i].Caption;
                            FieldstoTable[colcount].width     :=(TfrmKardKVMainForm(Self.Owner).PlanView.Columns[i].Width/sumwidth);

                            FieldstoTable[colcount].alignment:=TcxTextEditProperties(TfrmKardKVMainForm(Self.Owner).PlanView.Columns[i].Properties).Alignment.Horz;

                            FieldstoTable[colcount].order:=TfrmKardKVMainForm(Self.Owner).PlanView.Columns[i].Tag;

                            if FieldstoTable[colcount].fieldname='CONTROL_VALUE'
                            then begin
                                      FieldstoTable[colcount].caption:='Контрольний показник';
                            end;

                            if (TfrmKardKVMainForm(Self.Owner).PlanView.Columns[i].Tag in
                            [2, 3, 101, 102, 103, 104, 105, 106, 107, 108, 109, 112, 114, 121, 122, 141, 142, 143,
                            200, 201, 202])
                            then FieldstoTable[colcount].aggregative_function:='SUM';

                            Inc(colcount);
                  end;
       end;
  end;

  //Сортируем массив колонок
  for i:=0 to m-1 do
  begin
       for j:=i+1 to m-1 do
       begin
            if (FieldstoTable[i].order>FieldstoTable[j].order)
            then begin
                      tmp.fieldname:=FieldstoTable[j].fieldname;
                      tmp.caption  :=FieldstoTable[j].caption;
                      tmp.alignment:=FieldstoTable[j].alignment;
                      tmp.width    :=FieldstoTable[j].width;
                      tmp.aggregative_function :=FieldstoTable[j].aggregative_function;
                      tmp.order    :=FieldstoTable[j].order;

                      FieldstoTable[j].fieldname:=FieldstoTable[i].fieldname;
                      FieldstoTable[j].caption  :=FieldstoTable[i].caption;
                      FieldstoTable[j].alignment:=FieldstoTable[i].alignment;
                      FieldstoTable[j].width    :=FieldstoTable[i].width;
                      FieldstoTable[j].aggregative_function:=FieldstoTable[i].aggregative_function;
                      FieldstoTable[j].order    :=FieldstoTable[i].order;

                      FieldstoTable[i].fieldname:=tmp.fieldname;
                      FieldstoTable[i].caption  :=tmp.caption;
                      FieldstoTable[i].alignment:=tmp.alignment;
                      FieldstoTable[i].width    :=tmp.width;
                      FieldstoTable[i].aggregative_function:=tmp.aggregative_function;
                      FieldstoTable[i].order    :=tmp.order;
            end;
       end;
  end;


  f:=0;
  k:=0;
  pagewidth:=Page.Width-3.85*(Margins[0]+Margins[2]);

  for i:=0 to n+m-1 do
  begin
       if (i>=n)
       then begin
                 if (FieldstoTable[i-n].width>0.0)
                 then begin
                        f:=f+FieldstoTable[i-n].width;
                        k:=k+1;
                 end;
       end
       else
           if (GroupFields[i].width>0.0)
           then begin
                     f:=f+GroupFields[i].width;
                     k:=k+1;
           end;
  end;

  if (f>1.01)
  then begin
            ShowMessage('wrong columns width'); exit;
  end;

  if (m+n)>k
  then begin
            colwidth:=trunc(pagewidth*(1-f)/(m+n-k));
            for i:=0 to n+m-1 do
            begin
                 if (i>=n)
                 then begin
                           if (FieldstoTable[i-n].width=0)
                           then colswidth[i]:=colwidth
                           else colswidth[i]:=trunc(FieldstoTable[i-n].width*pagewidth);
                 end
                 else begin
                           if GroupFields[i].width=0
                           then colswidth[i]:=colwidth
                           else colswidth[i]:=trunc(GroupFields[i].width*pagewidth);
                 end;
            end;
  end
  else begin
            for i:=0 to n+m-1
            do begin
                    if (i>=n)
                    then colswidth[i]:=trunc(FieldstoTable[i-n].width*pagewidth)
                    else colswidth[i]:=trunc(GroupFields[i].width*pagewidth);
            end;
  end;



  //Создаем мемо времени-даты на заголовке отчета
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Font.Size:=6;
  Memo.Text:='[<Date>]   [<Time>]';
  Memo.SetBounds(0,0,80,10);


  //Создаем ссылку на приказ
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='ЗАТВЕРДЖЕНО';
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haRight;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,10,pagewidth,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='наказом Державного казначейства України';
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haRight;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,20,pagewidth,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='від 27 травня 2005 р. № 98';
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haRight;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,30,pagewidth,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:=TfrmKardKVMainForm(Self.Owner).organization;
  Memo.Frame.Typ:=[ftBottom];
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[fsUnderline];
  Memo.SetBounds(0,40,200,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='(назва установи)';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,50,200,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='Ідентифікаційний код за ЄДРПОУ';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[fsBold];
  Memo.SetBounds(0,60,200,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.Frame.Typ:=[ftLeft, ftRight, ftBottom, ftTop];
  Memo.Text:=TfrmKardKVMainForm(Self.Owner).KOD_EDRPOU;
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,70,150,20);


  //Создаем мемо заголовка отчета
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='КАРТКА АНАЛІТИЧНОГО ОБЛІКУ КАПІТАЛЬНИХ ВИДАТКІВ';
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[fsbold];
  Memo.SetBounds(0,80+10,pagewidth,10);

  //Создаем мемо периода карточки на заголовке отчета
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='за '+ DateToStr(TfrmKardKVMainForm(Self.Owner).datebeg)+' - '+DateToStr(TfrmKardKVMainForm(Self.Owner).dateend);
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,80+30,pagewidth,10);

  //Создаем мемо Обслуживаемой организации
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='Організація, що обслуговується: '+TfrmKardKVMainForm(Self.Owner).organization;
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,80+40,pagewidth,10);

  //Создаем мемо КПК, тип коштів
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:=TfrmKardKVMainForm(Self.Owner).Label1.Caption;
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,80+50,pagewidth,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:=TfrmKardKVMainForm(Self.Owner).Label2.Caption;
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,80+60,pagewidth,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='Одиниця виміру: грн.';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,80+70,pagewidth,10);

  pagewidth:=0;
  for i:=0 to n+m-1 do pagewidth:=pagewidth+colswidth[i];

  PageHeader:=TfrxPageHeader.Create(Page);
  PageHeader.Top:=0;
  PageHeader.Stretched:=false;
  PageHeader.Height:=80;
  PageHeader.Stretched:=false;

  //Формируем заголовок таблицы
  l:=0;
  first_flag:=false;
  le:=0; we:=0;
  for j:=n to n+m-1 do
  begin
       Memo:=TfrxMemoView.Create(PageHeader);
       Memo.Color:=RGB(235+0*2,235+0*2,170+(20-0*2)*0);
       Memo.CreateUniqueName;

       if FieldstoTable[j-n].order in ([101, 102, 103, 104, 105, 106, 107, 108, 109, 112, 114, 121, 122, 141, 142, 143])
       then begin
                 Memo.StretchMode:=smMaxHeight;
                 Memo.SetBounds(l,40,colswidth[j],40);
                 if not first_flag
                 then begin
                           le:=l;
                           first_flag:=true;
                           last_flag:=false;
                           we:=we + colswidth[j];
                 end
                 else we:=we + colswidth[j];

       end
       else begin
                 Memo.StretchMode:=smMaxHeight;
                 Memo.SetBounds(l,0,colswidth[j],80);
       end;
       l:=l+colswidth[j];
       Memo.Text:=FieldstoTable[j-n].caption;
       Memo.Font.Size:=8;
       Memo.Font.Style:=[fsBold];
       Memo.HAlign:=haCenter;
       Memo.VAlign:=TfrxVAlign(vaCenter);
       Memo.Frame.Style:=fsSolid;
       Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
  end;


  Memo:=TfrxMemoView.Create(PageHeader);
  Memo.Color:=RGB(235+0*2,235+0*2,170+(20-0*2)*0);
  Memo.CreateUniqueName;
  Memo.SetBounds(le,0,we,40);
  Memo.Text:='Збільшено необоротних активів';
  Memo.Font.Size:=8;
  Memo.Font.Style:=[fsBold];
  Memo.HAlign:=haCenter;
  Memo.VAlign:=TfrxVAlign(vaCenter);
  Memo.Frame.Style:=fsSolid;
  Memo.Frame.Typ:=[ftLeft, ftRight, ftTop ];

  //Формируем группировку в таблице
  l:=0;i:=0;
  for j:=0 to n-1 do
  begin
        b1gh := TfrxGroupHeader.Create(Page);
        b1gh.CreateUniqueName;
        b1gh.Stretched:=true;

        b1gh.Condition:=frxDBDataSet.Name+'."'+GroupFields[j].fieldname+'"';

        b1gh.Top:=j*10;
        b1gh.Height:=10;


        if not TfrmKardKVMainForm(Self.Owner).fOnly_ch_period
        then begin
                  Memo := TfrxMemoView.Create(b1gh);
                  Memo.CreateUniqueName;
                  Memo.StretchMode:=smMaxHeight;
                  Memo.SetBounds(l, 0, trunc(pagewidth)-l, 10);
                  Memo.Color:=RGB(235+j*2,235+j*2,170+(20-j*2)*j);

                  Memo := TfrxMemoView.Create(b1gh);
                  Memo.CreateUniqueName;
                  Memo.StretchMode:=smMaxHeight;
                  Memo.DataSet := frxDBDataSet;
                  Memo.DataField := GroupFields[j].fieldname;
                  Memo.SetBounds(l, 0, trunc(pagewidth)-l, 10);
                  l:=l+colswidth[j];
                  Memo.HAlign := haLeft;
                  Memo.Frame.Typ:=[ftLeft, ftRight, ftTop];

                  i:=0;
                  for k:=0 to j do
                  begin
                        line:=TfrxLineView.Create(b1gh);
                        line.StretchMode:=smMaxHeight;
                        line.Left:=i;
                        i:=i+colswidth[k];
                        line.Top:=0;
                        line.Height:=10;
                        line.Width:=0;
                  end;
        end;
  end;


  //Формируем саму таблицу
  DataBand := TfrxMasterData.Create(Page);
  DataBand.CreateUniqueName;
  DataBand.Stretched:=true;
  DataBand.DataSet := frxDBDataSet;
  DataBand.Top := n*10;
  DataBand.Height := 10;

  Memo := TfrxMemoView.Create(DataBand);
  Memo.CreateUniqueName;
  Memo.StretchMode:=smMaxHeight;
  Memo.Highlight.Condition:='<Line> mod 2 = 1';
  Memo.Highlight.Color:=RGB(245,245,245);
  Memo.SetBounds(l, 0, trunc(pagewidth)-l, 10);
  Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];

  l:=0;
  for j:=0 to m-1 do
  begin
          Memo := TfrxMemoView.Create(DataBand);
          Memo.CreateUniqueName;
          Memo.StretchMode:=smMaxHeight;
          Memo.DataSet := frxDBDataSet;
          Memo.DataField :=FieldstoTable[j].fieldname;
          Memo.SetBounds(i+l, 0, colswidth[j+n], 10);
          l:=l+colswidth[j+n];
          if FieldstoTable[j].alignment=taLeftJustify
          then Memo.HAlign := haLeft
          else if FieldstoTable[j].alignment=taRightJustify
               then Memo.HAlign := haRight
               else Memo.HAlign := haCenter;
          Memo.Frame.Typ:=[ftLeft];
  end;

  Band:=TfrxPageFooter.Create(Page);
  Band.CreateUniqueName;
  Band.SetBounds(0,0,pagewidth,20);

  Memo:=TfrxMemoView.Create(Band);
  Memo.Text:='[Page]';
  Memo.Font.Size:=12;
  Memo.HAlign:=haRight;
  Memo.SetBounds(pagewidth-40,0,40,20);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Font.Size:=6;
  Memo.Text:='[<Date>]  [<Time>]';
  Memo.SetBounds(0,10,80,10);

  Band:=TfrxReportSummary.Create(Page);
  Band.CreateUniqueName;
  Band.SetBounds(0,0,pagewidth,20);

  l:=50;
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='Виконавець:';
  Memo.Font.Size:=FontSize+2;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(l,50,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='________';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+100+20,50,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='(посада)';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+100+20,65,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='________';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+200+40,50,100,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='(підпис)';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+200+40,65,100,10);


  l:=400;
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='Перевірив:';
  Memo.Font.Size:=FontSize+2;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(l,50,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='________';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+100+20,50,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='(посада)';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+100+20,65,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='________';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+200+40,50,100,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='(підпис)';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+200+40,65,100,10);


end;

procedure TAcardPrintReportForm.CreatePageNO1;
var
  n,m,fi: short;
  FieldstoTable: array of FieldInfo;
  GroupFields: array of FieldInfo;
  Page: TfrxReportPage;
  RepSummary: TfrxReportSummary;
  DataBand: TfrxMasterData;
  Band: TfrxBand;
  PageHeader: TfrxPageHeader;
  Memo, Memo1: TfrxMemoView;
  line: TfrxLineView;
  b1gh: TfrxGroupHeader;
  b1gf: TfrxMasterData;
  i,j,k,l,colwidth, t: short;
  gcolcount, colcount:Integer;
  pagewidth, sumwidth: extended;
  f: single;
  colswidth: array of short;
  tmp:FieldInfo;
  first_flag, last_flag:boolean;
  le,we:short;
  s, str:string;
begin
  Page := TfrxReportPage.Create(frxReport);
  Page.CreateUniqueName;
  Page.SetDefaults;
  if FontType<>'' then Page.Font.Name:=FontType;
  if FontSize<>0  then Page.Font.Size:=FontSize;
  Page.Orientation :=TPrinterOrientation(PageOrient);
  Page.LeftMargin  :=Margins[0];
  Page.TopMargin   :=Margins[1];
  Page.RightMargin :=Margins[2];
  Page.BottomMargin:=Margins[3];

  //Создаем бэнд заголовок отчета
  pagewidth:=Page.Width-3.85*(Margins[0]+Margins[2]);
  Band:=TfrxReportTitle.Create(Page);
  Band.CreateUniqueName;
  Band.Stretched:=true;
  Band.SetBounds(10,0,pagewidth,90);

  colcount:=0;
  gcolcount:=0;
  sumwidth:=0;
  for i:=0 to TfrmKardNOMainForm(Self.Owner).PlanView.ColumnCount-1 do
  begin
       if (TfrmKardNOMainForm(Self.Owner).PlanView.Columns[i].GroupIndex>-1)
       then begin
                 Inc(gcolcount);
                 sumwidth:=sumwidth+0;//TfrmKardNOMainForm(Self.Owner).PlanView.Columns[i].Width;
       end
       else begin
                 if TfrmKardNOMainForm(Self.Owner).PlanView.Columns[i].Visible
                 then begin
                           Inc(colcount);
                           sumwidth:=sumwidth+TfrmKardNOMainForm(Self.Owner).PlanView.Columns[i].Width;
                 end;
       end;
  end;
  n:=gcolcount;
  m:=colcount;
  SetLength(colswidth,n+m);

  FieldstoTable:=nil;
  GroupFields  :=nil;

  SetLength(FieldstoTable,colcount);
  SetLength(GroupFields,gcolcount);

  colcount:=0;
  gcolcount:=0;

  for i:=0 to TfrmKardNOMainForm(Self.Owner).PlanView.ColumnCount-1 do
  begin
       if (TfrmKardNOMainForm(Self.Owner).PlanView.Columns[i].GroupIndex>-1)
       then begin
                  GroupFields[gcolcount].fieldname:=TfrmKardNOMainForm(Self.Owner).PlanView.Columns[i].DataBinding.FieldName;
                  GroupFields[gcolcount].caption:=TfrmKardNOMainForm(Self.Owner).PlanView.Columns[i].Caption;

                  GroupFields[gcolcount].alignment:=TcxTextEditProperties(TfrmKardNOMainForm(Self.Owner).PlanView.Columns[i].Properties).Alignment.Horz;
                  GroupFields[gcolcount].width:=0;//(TfrmGetKassaRasx(Self.Owner).PlanView.Columns[i].Width/sumwidth);
                  if (TfrmKardNOMainForm(Self.Owner).PlanView.Columns[i].SortOrder=soAscending)
                  then GroupFields[gcolcount].order:=1
                  else GroupFields[gcolcount].order:=0;

                  GroupFields[gcolcount].aggregative_function:='SUM';

                  Inc(gcolcount);
       end
       else begin
                  if TfrmKardNOMainForm(Self.Owner).PlanView.Columns[i].Visible
                  then begin
                            FieldstoTable[colcount].fieldname :=TfrmKardNOMainForm(Self.Owner).PlanView.Columns[i].DataBinding.FieldName;
                            FieldstoTable[colcount].caption   :=TfrmKardNOMainForm(Self.Owner).PlanView.Columns[i].Caption;
                            FieldstoTable[colcount].width     :=(TfrmKardNOMainForm(Self.Owner).PlanView.Columns[i].Width/sumwidth);

                            FieldstoTable[colcount].alignment :=TcxTextEditProperties(TfrmKardNOMainForm(Self.Owner).PlanView.Columns[i].Properties).Alignment.Horz;
                            FieldstoTable[colcount].order     :=TfrmKardNOMainForm(Self.Owner).PlanView.Columns[i].Tag;
                            FieldstoTable[colcount].bandTitle :=TfrmKardNOMainForm(Self.Owner).PlanView.Bands[TfrmKardNOMainForm(Self.Owner).PlanView.Columns[i].Position.BanDIndex].Caption;

                            IF (TfrmKardNOMainForm(Self.Owner).PlanView.Columns[i].Tag>0) then FieldstoTable[colcount].aggregative_function:='SUM';

                            Inc(colcount);
                  end;
       end;
  end;

  //Сортируем массив колонок
  for i:=0 to m-1 do
  begin
       for j:=i+1 to m-1 do
       begin
            if (FieldstoTable[i].order>FieldstoTable[j].order)
            then begin
                      tmp.fieldname:=FieldstoTable[j].fieldname;
                      tmp.caption  :=FieldstoTable[j].caption;
                      tmp.alignment:=FieldstoTable[j].alignment;
                      tmp.width    :=FieldstoTable[j].width;
                      tmp.aggregative_function :=FieldstoTable[j].aggregative_function;
                      tmp.order    :=FieldstoTable[j].order;
                      tmp.bandTitle:=FieldstoTable[j].bandTitle;

                      FieldstoTable[j].fieldname:=FieldstoTable[i].fieldname;
                      FieldstoTable[j].caption  :=FieldstoTable[i].caption;
                      FieldstoTable[j].alignment:=FieldstoTable[i].alignment;
                      FieldstoTable[j].width    :=FieldstoTable[i].width;
                      FieldstoTable[j].aggregative_function:=FieldstoTable[i].aggregative_function;
                      FieldstoTable[j].order    :=FieldstoTable[i].order;
                      FieldstoTable[j].bandTitle:=FieldstoTable[i].bandTitle;

                      FieldstoTable[i].fieldname:=tmp.fieldname;
                      FieldstoTable[i].caption  :=tmp.caption;
                      FieldstoTable[i].alignment:=tmp.alignment;
                      FieldstoTable[i].width    :=tmp.width;
                      FieldstoTable[i].aggregative_function:=tmp.aggregative_function;
                      FieldstoTable[i].order    :=tmp.order;
                      FieldstoTable[i].bandTitle:=tmp.bandTitle;
            end;
       end;
  end;


  f:=0;
  k:=0;
  pagewidth:=Page.Width-3.85*(Margins[0]+Margins[2]);

  for i:=0 to n+m-1 do
  begin
       if (i>=n)
       then begin
                 if (FieldstoTable[i-n].width>0.0)
                 then begin
                        f:=f+FieldstoTable[i-n].width;
                        k:=k+1;
                 end;
       end
       else
           if (GroupFields[i].width>0.0)
           then begin
                     f:=f+GroupFields[i].width;
                     k:=k+1;
           end;
  end;

  if (f>1.01)
  then begin
            ShowMessage('wrong columns width'); exit;
  end;

  if (m+n)>k
  then begin
            colwidth:=trunc(pagewidth*(1-f)/(m+n-k));
            for i:=0 to n+m-1 do
            begin
                 if (i>=n)
                 then begin
                           if (FieldstoTable[i-n].width=0)
                           then colswidth[i]:=colwidth
                           else colswidth[i]:=trunc(FieldstoTable[i-n].width*pagewidth);
                 end
                 else begin
                           if GroupFields[i].width=0
                           then colswidth[i]:=colwidth
                           else colswidth[i]:=trunc(GroupFields[i].width*pagewidth);
                 end;
            end;
  end
  else begin
            for i:=0 to n+m-1
            do begin
                    if (i>=n)
                    then colswidth[i]:=trunc(FieldstoTable[i-n].width*pagewidth)
                    else colswidth[i]:=trunc(GroupFields[i].width*pagewidth);
            end;
  end;



  //Создаем мемо времени-даты на заголовке отчета
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Font.Size:=6;
  Memo.Text:='[<Date>]   [<Time>]';
  Memo.SetBounds(0,0,80,10);


  //Создаем ссылку на приказ
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='ЗАТВЕРДЖЕНО';
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haRight;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,10,pagewidth,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='наказом Державного казначейства України';
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haRight;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,20,pagewidth,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='від 06 жовтня 2000 р. № 100';
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haRight;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,30,pagewidth,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:=TfrmKardNOMainForm(Self.Owner).organization;
  Memo.Frame.Typ:=[ftBottom];
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[fsUnderline];
  Memo.SetBounds(0,40,200,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='(назва установи)';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,50,200,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='Ідентифікаційний код за ЄДРПОУ';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[fsBold];
  Memo.SetBounds(0,60,200,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.Frame.Typ:=[ftLeft, ftRight, ftBottom, ftTop];
  Memo.Text:=TfrmKardNOMainForm(Self.Owner).KOD_EDRPOU;
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,70,150,20);


  //Создаем мемо заголовка отчета
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='КАРТКА АНАЛІТИЧНОГО ОБЛІКУ ГОТІВКОВИХ ОПЕРАЦІЙ';
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[fsbold];
  Memo.SetBounds(0,80+10,pagewidth,10);

  //Создаем мемо периода карточки на заголовке отчета
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='за '+ DateToStr(StartOfTheMonth(TfrmKardNOMainForm(Self.Owner).datebeg))+' - '+DateToStr(EndOfTheMonth(TfrmKardNOMainForm(Self.Owner).datebeg));
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,80+30,pagewidth,10);

  //Создаем мемо Обслуживаемой организации
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='Організація, що обслуговується: '+TfrmKardNOMainForm(Self.Owner).organization;
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,80+40,pagewidth,10);

  //Создаем мемо КПК, тип коштів
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:=TfrmKardNOMainForm(Self.Owner).Label1.Caption;
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,80+50,pagewidth,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:=TfrmKardNOMainForm(Self.Owner).Label2.Caption;
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,80+60,pagewidth,10);


  pagewidth:=0;
  for i:=0 to n+m-1 do pagewidth:=pagewidth+colswidth[i];

  PageHeader:=TfrxPageHeader.Create(Page);
  PageHeader.Top:=0;
  PageHeader.Stretched:=false;
  PageHeader.Height:=80;
  PageHeader.Stretched:=false;

  //Формируем заголовок таблицы
  l:=0;
  first_flag:=false;
  le:=0; we:=0;
  for j:=n to n+m-1 do
  begin
       Memo:=TfrxMemoView.Create(PageHeader);
       //Memo.Color:=RGB(235+0*2,235+0*2,170+(20-0*2)*0);
       Memo.CreateUniqueName;
       Memo.Text:=FieldstoTable[j-n].caption;
       Memo.Font.Size:=8;
       Memo.HAlign:=haCenter;
       Memo.VAlign:=TfrxVAlign(vaCenter);
       Memo.Frame.Style:=fsSolid;
       Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];

       if  FieldstoTable[j-n].order=0
       then begin
                 Memo.SetBounds(l,0,colswidth[j],80);
                 Memo.StretchMode:=smMaxHeight;
       end
       else begin
                 Memo.SetBounds(l,40,colswidth[j],40);


                 if not first_flag
                 then begin
                           first_flag:=true;
                           le:=l;
                           fi:=1;
                           we:=colswidth[j];
                 end
                 else begin
                           fi:=fi+1;
                           we:=we+colswidth[j];
                 end;



                 if (fi=3)
                 then begin
                           first_flag:=false;
                           Memo1:=TfrxMemoView.Create(PageHeader);
                           Memo1.SetBounds(le,0,we,40);
                           //Memo1.Color:=RGB(235+0*2,235+0*2,170+(20-0*2)*0);
                           Memo1.CreateUniqueName;
                           Memo1.Text:=FieldstoTable[j-n].bandTitle;
                           Memo1.Font.Size:=8;
                           Memo1.HAlign:=haCenter;
                           Memo1.VAlign:=TfrxVAlign(vaCenter);
                           Memo1.Frame.Style:=fsSolid;
                           Memo1.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
                 end;
       end;

       l:=l+colswidth[j];

  end;

  //Формируем группировку в таблице

  l:=0;i:=0;
  for j:=0 to n-1 do begin
    b1gh := TfrxGroupHeader.Create(Page);
    b1gh.CreateUniqueName;
    b1gh.Stretched:=true;
    b1gh.Condition:=frxDBDataSet.Name+'."'+GroupFields[j].fieldname+'"';
    b1gh.Top:=j*10;
    b1gh.Height:=10;

    Memo := TfrxMemoView.Create(b1gh);
    Memo.CreateUniqueName;
    Memo.StretchMode:=smMaxHeight;
    Memo.SetBounds(l, 0, trunc(pagewidth)-l, 10);
    Memo.Color:=RGB(235+j*2,235+j*2,170+(20-j*2)*j);

    Memo := TfrxMemoView.Create(b1gh);
    Memo.CreateUniqueName;
    Memo.StretchMode:=smMaxHeight;
    Memo.DataSet := frxDBDataSet;
    Memo.DataField := GroupFields[j].fieldname;
    Memo.SetBounds(l, 0, trunc(pagewidth)-l, 10);
    l:=l+colswidth[j];
    Memo.HAlign := haLeft;
    Memo.Frame.Typ:=[ftLeft, ftRight, ftTop];
    i:=0;
    for k:=0 to j do begin
      line:=TfrxLineView.Create(b1gh);
      line.StretchMode:=smMaxHeight;
      line.Left:=i;
      i:=i+colswidth[k];
      line.Top:=0;
      line.Height:=10;
      line.Width:=0;
    end;
  end;


  //Формируем саму таблицу
  DataBand := TfrxMasterData.Create(Page);
  DataBand.CreateUniqueName;
  DataBand.Stretched:=true;
  DataBand.DataSet := frxDBDataSet;
  DataBand.Top := n*10;
  DataBand.Height := 10;

  Memo := TfrxMemoView.Create(DataBand);
  Memo.CreateUniqueName;
  Memo.StretchMode:=smMaxHeight;
  Memo.Highlight.Condition:='<Line> mod 2 = 1';
  Memo.Highlight.Color:=RGB(245,245,245);
  Memo.SetBounds(l, 0, trunc(pagewidth)-l, 10);
  Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];

  l:=0;
  for j:=0 to m-1 do
  begin
          Memo := TfrxMemoView.Create(DataBand);
          Memo.CreateUniqueName;
          Memo.StretchMode:=smMaxHeight;
          Memo.DataSet := frxDBDataSet;
          Memo.AllowHTMLTags:=true;
          Memo.DataField :=FieldstoTable[j].fieldname;
          Memo.SetBounds(i+l, 0, colswidth[j+n], 10);
          l:=l+colswidth[j+n];
          if FieldstoTable[j].alignment=taLeftJustify
          then Memo.HAlign := haLeft
          else if FieldstoTable[j].alignment=taRightJustify
               then Memo.HAlign := haRight
               else Memo.HAlign := haCenter;
          Memo.Frame.Typ:=[ftLeft];
  end;


  Band:=TfrxPageFooter.Create(Page);
  Band.CreateUniqueName;
  Band.SetBounds(0,0,pagewidth,20);

  Memo:=TfrxMemoView.Create(Band);
  Memo.Text:='[Page]';
  Memo.Font.Size:=12;
  Memo.HAlign:=haRight;
  Memo.SetBounds(pagewidth-40,0,40,20);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Font.Size:=6;
  Memo.Text:='[<Date>]  [<Time>]';
  Memo.SetBounds(0,10,80,10);

  Band:=TfrxReportSummary.Create(Page);
  Band.CreateUniqueName;
  Band.SetBounds(0,0,pagewidth,20);

  l:=50;
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='Виконавець:';
  Memo.Font.Size:=FontSize+2;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(l,50,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='________';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+100+20,50,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='(посада)';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+100+20,65,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='________';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+200+40,50,100,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='(підпис)';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+200+40,65,100,10);


  l:=400;
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='Перевірив:';
  Memo.Font.Size:=FontSize+2;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(l,50,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='________';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+100+20,50,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='(посада)';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+100+20,65,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='________';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+200+40,50,100,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='(підпис)';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+200+40,65,100,10);


end;


procedure TAcardPrintReportForm.CreatePageAG1;
var
  n,m: short;
  FieldstoTable: array of FieldInfo;
  GroupFields: array of FieldInfo;
  Page: TfrxReportPage;
  RepSummary: TfrxReportSummary;
  DataBand: TfrxMasterData;
  Band: TfrxBand;
  PageHeader: TfrxPageHeader;
  Memo: TfrxMemoView;
  line: TfrxLineView;
  b1gh: TfrxGroupHeader;
  b1gf: TfrxGroupFooter;
  i,j,k,l,t,colwidth: short;
  gcolcount, colcount, left_first_kekv:Integer;
  pagewidth, sumwidth, kekv_sumwidth: extended;
  f: single;
  colswidth: array of short;
  tmp:FieldInfo;
  s:string;
begin
  Page := TfrxReportPage.Create(frxReport);
  Page.CreateUniqueName;
  Page.SetDefaults;
  if FontType<>'' then Page.Font.Name:=FontType;
  if FontSize<>0  then Page.Font.Size:=FontSize;
  Page.Orientation :=TPrinterOrientation(PageOrient);
  Page.LeftMargin  :=Margins[0];
  Page.TopMargin   :=Margins[1];
  Page.RightMargin :=Margins[2];
  Page.BottomMargin:=Margins[3];

  //Создаем бэнд заголовок отчета
  pagewidth:=Page.Width-3.85*(Margins[0]+Margins[2]);
  Band:=TfrxReportTitle.Create(Page);
  Band.CreateUniqueName;
  Band.Stretched:=true;
  Band.SetBounds(10,0,pagewidth,90);

  colcount:=0;
  gcolcount:=0;
  sumwidth:=0;
  for i:=0 to TfrmGetAssignMain(Self.Owner).PlanView.ColumnCount-1 do
  begin
       if (TfrmGetAssignMain(Self.Owner).PlanView.Columns[i].GroupIndex>-1)
       then begin
                 Inc(gcolcount);
                 sumwidth:=sumwidth+0;
       end
       else begin
                 Inc(colcount);
                 sumwidth:=sumwidth+TfrmGetAssignMain(Self.Owner).PlanView.Columns[i].Width;
       end;
  end;
  n:=gcolcount;
  m:=colcount;
  SetLength(colswidth,n+m);

  FieldstoTable:=nil;
  GroupFields  :=nil;

  SetLength(FieldstoTable,colcount);
  SetLength(GroupFields,gcolcount);

  colcount:=0;
  gcolcount:=0;

  for i:=0 to TfrmGetAssignMain(Self.Owner).PlanView.ColumnCount-1 do
  begin
       if (TfrmGetAssignMain(Self.Owner).PlanView.Columns[i].GroupIndex>-1)
       then begin
                  GroupFields[gcolcount].fieldname:=TfrmGetAssignMain(Self.Owner).PlanView.Columns[i].DataBinding.FieldName;
                  GroupFields[gcolcount].caption:=TfrmGetAssignMain(Self.Owner).PlanView.Columns[i].Caption;

                  GroupFields[gcolcount].alignment:=TcxTextEditProperties(TfrmGetAssignMain(Self.Owner).PlanView.Columns[i].Properties).Alignment.Horz;
                  GroupFields[gcolcount].width:=0;
                  if (TfrmGetAssignMain(Self.Owner).PlanView.Columns[i].SortOrder=soAscending)
                  then GroupFields[gcolcount].order:=1
                  else GroupFields[gcolcount].order:=0;

                  GroupFields[gcolcount].aggregative_function:='';

                  Inc(gcolcount);
       end
       else begin
                  FieldstoTable[colcount].fieldname:=TfrmGetAssignMain(Self.Owner).PlanView.Columns[i].DataBinding.FieldName;
                  FieldstoTable[colcount].caption:=TfrmGetAssignMain(Self.Owner).PlanView.Columns[i].Caption;
                  FieldstoTable[colcount].width:=(TfrmGetAssignMain(Self.Owner).PlanView.Columns[i].Width/sumwidth);

                  FieldstoTable[colcount].alignment:=TcxTextEditProperties(TfrmGetAssignMain(Self.Owner).PlanView.Columns[i].Properties).Alignment.Horz;

                  if (TfrmGetAssignMain(Self.Owner).PlanView.Columns[i].SortOrder=soAscending)
                  then FieldstoTable[colcount].order:=1
                  else FieldstoTable[colcount].order:=0;

                  if (TfrmGetAssignMain(Self.Owner).PlanView.Columns[i].Tag>0)
                  or (TfrmGetAssignMain(Self.Owner).PlanView.Columns[i].DataBinding.FieldName='KASSA_SUMMA')
                  then FieldstoTable[colcount].aggregative_function:='SUM';

                  if TfrmGetAssignMain(Self.Owner).PlanView.Columns[i].tag<>0
                  then FieldstoTable[colcount].order:=StrToInt(TfrmGetAssignMain(Self.Owner).PlanView.Columns[i].Caption)
                  else FieldstoTable[colcount].order:=0;

                  Inc(colcount);
       end;
  end;

  //Сортируем массив колонок
  for i:=0 to m-1 do
  begin
       for j:=i+1 to m-1 do
       begin
            if (FieldstoTable[i].order>FieldstoTable[j].order)
            then begin
                      tmp.fieldname:=FieldstoTable[j].fieldname;
                      tmp.caption  :=FieldstoTable[j].caption;
                      tmp.alignment:=FieldstoTable[j].alignment;
                      tmp.width    :=FieldstoTable[j].width;
                      tmp.aggregative_function :=FieldstoTable[j].aggregative_function;
                      tmp.order    :=FieldstoTable[j].order;

                      FieldstoTable[j].fieldname:=FieldstoTable[i].fieldname;
                      FieldstoTable[j].caption  :=FieldstoTable[i].caption;
                      FieldstoTable[j].alignment:=FieldstoTable[i].alignment;
                      FieldstoTable[j].width    :=FieldstoTable[i].width;
                      FieldstoTable[j].aggregative_function:=FieldstoTable[i].aggregative_function;
                      FieldstoTable[j].order    :=FieldstoTable[i].order;

                      FieldstoTable[i].fieldname:=tmp.fieldname;
                      FieldstoTable[i].caption  :=tmp.caption;
                      FieldstoTable[i].alignment:=tmp.alignment;
                      FieldstoTable[i].width    :=tmp.width;
                      FieldstoTable[i].aggregative_function:=tmp.aggregative_function;
                      FieldstoTable[i].order    :=tmp.order;
            end;
       end;
  end;


  f:=0;
  k:=0;
  pagewidth:=Page.Width-3.85*(Margins[0]+Margins[2]);

  for i:=0 to n+m-1 do
  begin
       if (i>=n)
       then begin
                 if (FieldstoTable[i-n].width>0.0)
                 then begin
                        f:=f+FieldstoTable[i-n].width;
                        k:=k+1;
                 end;
       end
       else
           if (GroupFields[i].width>0.0)
           then begin
                     f:=f+GroupFields[i].width;
                     k:=k+1;
           end;
  end;

  if (f>1.01)
  then begin
            ShowMessage('wrong columns width'); exit;
  end;

  if (m+n)>k
  then begin
            colwidth:=trunc(pagewidth*(1-f)/(m+n-k));
            for i:=0 to n+m-1 do
            begin
                 if (i>=n)
                 then begin
                           if (FieldstoTable[i-n].width=0)
                           then colswidth[i]:=colwidth
                           else colswidth[i]:=trunc(FieldstoTable[i-n].width*pagewidth);
                 end
                 else begin
                           if GroupFields[i].width=0
                           then colswidth[i]:=colwidth
                           else colswidth[i]:=trunc(GroupFields[i].width*pagewidth);
                 end;
            end;
  end
  else begin
            for i:=0 to n+m-1
            do begin
                    if (i>=n)
                    then colswidth[i]:=trunc(FieldstoTable[i-n].width*pagewidth)
                    else colswidth[i]:=trunc(GroupFields[i].width*pagewidth);
            end;
  end;



  //Создаем мемо времени-даты на заголовке отчета
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Font.Size:=6;
  Memo.Text:='[<Date>]   [<Time>]';
  Memo.SetBounds(0,0,80,10);

  //Создаем ссылку на приказ
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='ЗАТВЕРДЖЕНО';
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(pagewidth-400,10,pagewidth-20,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='наказом Державного казначейства України';
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(pagewidth-400,20,pagewidth-20,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='від 6 жовтня 2000 р. № 100';
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(pagewidth-400,30,pagewidth-20,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:=TfrmGetAssignMain(Self.Owner).organization;
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,35,200,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='(назва установи)';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,50,200,10);
  Memo.Frame.Typ:=[ftTop];

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='Ідентифікаційний код за ЄДРПОУ';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[fsBold];
  Memo.SetBounds(0,60,200,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.Frame.Typ:=[ftLeft, ftRight, ftBottom, ftTop];
  Memo.Text:=TfrmGetAssignMain(Self.Owner).KOD_EDRPOU;
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(210,60,90,20);

  //Создаем мемо заголовка отчета
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='КАРТКА АНАЛІТИЧНОГО ОБЛІКУ ОТРИМАНИХ АСИГНУВАНЬ';
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[fsbold];
  Memo.SetBounds(0,80+10,pagewidth,10);

  //Создаем мемо периода карточки на заголовке отчета
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='за '+ IntToStr(YearOf(TfrmGetAssignMain(Self.Owner).date_beg))+' р.';
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,80+30,pagewidth,10);

  //Создаем мемо КПК, тип коштів
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:=TfrmGetAssignMain(Self.Owner).Label1.Caption;
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,80+50,pagewidth,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:=TfrmGetAssignMain(Self.Owner).Label2.Caption;
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,80+60,pagewidth,10);



  pagewidth:=0;
  for i:=0 to n+m-1 do pagewidth:=pagewidth+colswidth[i];

  PageHeader:=TfrxPageHeader.Create(Page);
  PageHeader.Top:=0;
  PageHeader.Stretched:=true;
  PageHeader.Height:=10;
  PageHeader.Stretched:=true;

  //Формируем заголовок таблицы
  l:=0;
  k:=Page.Font.Size;
  left_first_kekv:=0;
  kekv_sumwidth:=0;
  for j:=n to n+m-1 do
  begin
       Memo:=TfrxMemoView.Create(PageHeader);
       Memo.CreateUniqueName;
       Memo.StretchMode:=smMaxHeight;
       if FieldstoTable[j-n].order>5
       then begin
                 Memo.SetBounds(l,60,colswidth[j],50);
                 if left_first_kekv=0 then left_first_kekv:=l;
                 kekv_sumwidth:=kekv_sumwidth+colswidth[j];
       end
       else Memo.SetBounds(l,10,colswidth[j],100);
       l:=l+colswidth[j];
       Memo.Text:=FieldstoTable[j-n].caption;
       Memo.Font.Size:=k;
       Memo.Font.Style:=[fsBold];
       Memo.HAlign:=haCenter;
       Memo.VAlign:=TfrxVAlign(vaCenter);
       Memo.Frame.Style:=fsSolid;
       Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
  end;

  if left_first_kekv>0
  then begin
            Memo:=TfrxMemoView.Create(PageHeader);
            Memo.CreateUniqueName;
            Memo.StretchMode:=smDontStretch;
            Memo.SetBounds(left_first_kekv,10,kekv_sumwidth,50);
            Memo.Text:='У тому числі за кодами економічної класифікації видатків';
            Memo.Font.Size:=k;
            Memo.Font.Style:=[fsBold];
            Memo.HAlign:=haCenter;
            Memo.VAlign:=TfrxVAlign(vaCenter);
            Memo.Frame.Style:=fsSolid;
            Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
   end;         


  //Формируем группировку в таблице
  l:=0;i:=0;
  for j:=0 to n-1 do begin
    b1gh := TfrxGroupHeader.Create(Page);
    b1gh.CreateUniqueName;
    b1gh.Stretched:=true;
    b1gh.Condition:=frxDBDataSet.Name+'."'+GroupFields[j].fieldname+'"';
    b1gh.Top:=j*10;
    b1gh.Height:=10;

    Memo := TfrxMemoView.Create(b1gh);
    Memo.CreateUniqueName;
    Memo.StretchMode:=smMaxHeight;
    Memo.SetBounds(l, 0, trunc(pagewidth)-l, 10);
    Memo.Color:=RGB(235+j*2,235+j*2,170+(20-j*2)*j);

    Memo := TfrxMemoView.Create(b1gh);
    Memo.CreateUniqueName;
    Memo.StretchMode:=smMaxHeight;
    Memo.DataSet := frxDBDataSet;
    Memo.DataField := GroupFields[j].fieldname;
    Memo.SetBounds(l, 0, trunc(pagewidth)-l, 10);
    l:=l+colswidth[j];
    Memo.HAlign := haLeft;
    Memo.Frame.Typ:=[ftLeft, ftRight, ftTop];
    i:=0;
    for k:=0 to j do begin
      line:=TfrxLineView.Create(b1gh);
      line.StretchMode:=smMaxHeight;
      line.Left:=i;
      i:=i+colswidth[k];
      line.Top:=0;
      line.Height:=10;
      line.Width:=0;
    end;
  end;

  //Формируем саму таблицу
  DataBand := TfrxMasterData.Create(Page);
  DataBand.CreateUniqueName;
  DataBand.Stretched:=true;
  DataBand.DataSet := frxDBDataSet;
  DataBand.Top := n*10;
  DataBand.Height := 10;

  Memo := TfrxMemoView.Create(DataBand);
  Memo.CreateUniqueName;
  Memo.StretchMode:=smMaxHeight;
  Memo.Highlight.Condition:='<Line> mod 2 = 1';
  Memo.Highlight.Color:=RGB(245,245,245);
  Memo.SetBounds(l, 0, trunc(pagewidth)-l, 10);
  Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];

  l:=0;
  for j:=0 to m-1 do
  begin
          Memo := TfrxMemoView.Create(DataBand);
          Memo.CreateUniqueName;
          Memo.StretchMode:=smMaxHeight;
          Memo.DataSet := frxDBDataSet;
          Memo.DataField :=FieldstoTable[j].fieldname;
          Memo.SetBounds(i+l, 0, colswidth[j+n], 10);
          l:=l+colswidth[j+n];
          if FieldstoTable[j].alignment=taLeftJustify
          then Memo.HAlign := haLeft
          else if FieldstoTable[j].alignment=taRightJustify
               then Memo.HAlign := haRight
               else Memo.HAlign := haCenter;
          Memo.Frame.Typ:=[ftLeft];
  end;

  Band:=TfrxPageFooter.Create(Page);
  Band.CreateUniqueName;
  Band.SetBounds(0,0,pagewidth,20);

  Memo:=TfrxMemoView.Create(Band);
  Memo.Text:='[Page]';
  Memo.Font.Size:=12;
  Memo.HAlign:=haRight;
  Memo.SetBounds(pagewidth-40,0,40,20);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Font.Size:=6;
  Memo.Text:='[<Date>]  [<Time>]';
  Memo.SetBounds(0,10,80,10);
end;

procedure TAcardPrintReportForm.CreatePageAG2;
var
  n,m: short;
  FieldstoTable: array of FieldInfo;
  GroupFields: array of FieldInfo;
  Page: TfrxReportPage;
  RepSummary: TfrxReportSummary;
  DataBand: TfrxMasterData;
  Band: TfrxBand;
  PageHeader: TfrxPageHeader;
  Memo: TfrxMemoView;
  line: TfrxLineView;
  b1gh: TfrxGroupHeader;
  b1gf: TfrxGroupFooter;
  i,j,k,l,t,r,colwidth: short;
  gcolcount, colcount, left_first_kekv:Integer;
  pagewidth, sumwidth, kekv_sumwidth: extended;
  f: single;
  colswidth: array of short;
  tmp:FieldInfo;
  s:string;
begin
  Page := TfrxReportPage.Create(frxReport);
  Page.CreateUniqueName;
  Page.SetDefaults;
  if FontType<>'' then Page.Font.Name:=FontType;
  if FontSize<>0  then Page.Font.Size:=FontSize;
  Page.Orientation :=TPrinterOrientation(PageOrient);
  Page.LeftMargin  :=Margins[0];
  Page.TopMargin   :=Margins[1];
  Page.RightMargin :=Margins[2];
  Page.BottomMargin:=Margins[3];

  //Создаем бэнд заголовок отчета
  pagewidth:=Page.Width-3.85*(Margins[0]+Margins[2]);
  Band:=TfrxReportTitle.Create(Page);
  Band.CreateUniqueName;
  Band.Stretched:=true;
  Band.SetBounds(10,0,pagewidth,90);

  colcount:=0;
  gcolcount:=0;
  sumwidth:=0;
  for i:=0 to TfrmGetAssignMain(Self.Owner).FactView.ColumnCount-1 do
  begin
       if (TfrmGetAssignMain(Self.Owner).FactView.Columns[i].GroupIndex>-1)
       then begin
                 Inc(gcolcount);
                 sumwidth:=sumwidth+0;
       end
       else begin
                 Inc(colcount);
                 sumwidth:=sumwidth+TfrmGetAssignMain(Self.Owner).FactView.Columns[i].Width;
       end;
  end;
  n:=gcolcount;
  m:=colcount;
  SetLength(colswidth,n+m);

  FieldstoTable:=nil;
  GroupFields  :=nil;

  SetLength(FieldstoTable,colcount);
  SetLength(GroupFields,gcolcount);

  colcount:=0;
  gcolcount:=0;

  for i:=0 to TfrmGetAssignMain(Self.Owner).FactView.ColumnCount-1 do
  begin
       if (TfrmGetAssignMain(Self.Owner).FactView.Columns[i].GroupIndex>-1)
       then begin
                  GroupFields[gcolcount].fieldname:=TfrmGetAssignMain(Self.Owner).FactView.Columns[i].DataBinding.FieldName;
                  GroupFields[gcolcount].caption:=TfrmGetAssignMain(Self.Owner).FactView.Columns[i].Caption;

                  GroupFields[gcolcount].alignment:=TcxTextEditProperties(TfrmGetAssignMain(Self.Owner).FactView.Columns[i].Properties).Alignment.Horz;
                  GroupFields[gcolcount].width:=0;
                  if (TfrmGetAssignMain(Self.Owner).FactView.Columns[i].SortOrder=soAscending)
                  then GroupFields[gcolcount].order:=1
                  else GroupFields[gcolcount].order:=0;

                  GroupFields[gcolcount].aggregative_function:='';

                  Inc(gcolcount);
       end
       else begin
                  FieldstoTable[colcount].fieldname:=TfrmGetAssignMain(Self.Owner).FactView.Columns[i].DataBinding.FieldName;
                  FieldstoTable[colcount].caption:=TfrmGetAssignMain(Self.Owner).FactView.Columns[i].Caption;
                  FieldstoTable[colcount].width:=(TfrmGetAssignMain(Self.Owner).FactView.Columns[i].Width/sumwidth);

                  FieldstoTable[colcount].alignment:=TcxTextEditProperties(TfrmGetAssignMain(Self.Owner).FactView.Columns[i].Properties).Alignment.Horz;

                  if (TfrmGetAssignMain(Self.Owner).FactView.Columns[i].SortOrder=soAscending)
                  then FieldstoTable[colcount].order:=1
                  else FieldstoTable[colcount].order:=0;

                  if (TfrmGetAssignMain(Self.Owner).FactView.Columns[i].Tag>0)
                  or (TfrmGetAssignMain(Self.Owner).FactView.Columns[i].DataBinding.FieldName='KASSA_SUMMA')
                  then FieldstoTable[colcount].aggregative_function:='SUM';


                  if TfrmGetAssignMain(Self.Owner).FactView.Columns[i].tag<>0
                  then begin
                            if TfrmGetAssignMain(Self.Owner).ThruKekv
                            then FieldstoTable[colcount].order:=i
                            else FieldstoTable[colcount].order:=StrToInt(TfrmGetAssignMain(Self.Owner).FactView.Columns[i].Caption)
                  end
                  else FieldstoTable[colcount].order:=0;

                  Inc(colcount);
       end;
  end;

  //Сортируем массив колонок
  for i:=0 to m-1 do
  begin
       for j:=i+1 to m-1 do
       begin
            if (FieldstoTable[i].order>FieldstoTable[j].order)
            then begin
                      tmp.fieldname:=FieldstoTable[j].fieldname;
                      tmp.caption  :=FieldstoTable[j].caption;
                      tmp.alignment:=FieldstoTable[j].alignment;
                      tmp.width    :=FieldstoTable[j].width;
                      tmp.aggregative_function :=FieldstoTable[j].aggregative_function;
                      tmp.order    :=FieldstoTable[j].order;

                      FieldstoTable[j].fieldname:=FieldstoTable[i].fieldname;
                      FieldstoTable[j].caption  :=FieldstoTable[i].caption;
                      FieldstoTable[j].alignment:=FieldstoTable[i].alignment;
                      FieldstoTable[j].width    :=FieldstoTable[i].width;
                      FieldstoTable[j].aggregative_function:=FieldstoTable[i].aggregative_function;
                      FieldstoTable[j].order    :=FieldstoTable[i].order;

                      FieldstoTable[i].fieldname:=tmp.fieldname;
                      FieldstoTable[i].caption  :=tmp.caption;
                      FieldstoTable[i].alignment:=tmp.alignment;
                      FieldstoTable[i].width    :=tmp.width;
                      FieldstoTable[i].aggregative_function:=tmp.aggregative_function;
                      FieldstoTable[i].order    :=tmp.order;
            end;
       end;
  end;


  f:=0;
  k:=0;
  pagewidth:=Page.Width-3.85*(Margins[0]+Margins[2]);

  for i:=0 to n+m-1 do
  begin
       if (i>=n)
       then begin
                 if (FieldstoTable[i-n].width>0.0)
                 then begin
                        f:=f+FieldstoTable[i-n].width;
                        k:=k+1;
                 end;
       end
       else
           if (GroupFields[i].width>0.0)
           then begin
                     f:=f+GroupFields[i].width;
                     k:=k+1;
           end;
  end;

  if (f>1.01)
  then begin
            ShowMessage('wrong columns width'); exit;
  end;

  if (m+n)>k
  then begin
            colwidth:=trunc(pagewidth*(1-f)/(m+n-k));
            for i:=0 to n+m-1 do
            begin
                 if (i>=n)
                 then begin
                           if (FieldstoTable[i-n].width=0)
                           then colswidth[i]:=colwidth
                           else colswidth[i]:=trunc(FieldstoTable[i-n].width*pagewidth);
                 end
                 else begin
                           if GroupFields[i].width=0
                           then colswidth[i]:=colwidth
                           else colswidth[i]:=trunc(GroupFields[i].width*pagewidth);
                 end;
            end;
  end
  else begin
            for i:=0 to n+m-1
            do begin
                    if (i>=n)
                    then colswidth[i]:=trunc(FieldstoTable[i-n].width*pagewidth)
                    else colswidth[i]:=trunc(GroupFields[i].width*pagewidth);
            end;
  end;



  //Создаем мемо времени-даты на заголовке отчета
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Font.Size:=6;
  Memo.Text:='[<Date>]   [<Time>]';
  Memo.SetBounds(0,0,80,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='Надійшло асигнувань';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[fsbold];
  Memo.SetBounds(0,15,pagewidth,10);

  pagewidth:=0;
  for i:=0 to n+m-1 do pagewidth:=pagewidth+colswidth[i];

  PageHeader:=TfrxPageHeader.Create(Page);
  PageHeader.Top:=0;
  PageHeader.Stretched:=true;
  PageHeader.Height:=10;
  PageHeader.Stretched:=true;

  //Формируем заголовок таблицы
  l:=0;
  k:=Page.Font.Size;
  left_first_kekv:=0;
  kekv_sumwidth:=0;
  for j:=n to n+m-1 do
  begin
       Memo:=TfrxMemoView.Create(PageHeader);
       Memo.CreateUniqueName;
       Memo.StretchMode:=smMaxHeight;
       if FieldstoTable[j-n].order>3
       then begin
                 Memo.SetBounds(l,60,colswidth[j],50);
                 if left_first_kekv=0 then left_first_kekv:=l;
                 kekv_sumwidth:=kekv_sumwidth+colswidth[j];
       end
       else Memo.SetBounds(l,10,colswidth[j],100);
       l:=l+colswidth[j];
       Memo.Text:=FieldstoTable[j-n].caption;
       Memo.Font.Size:=k;
       Memo.Font.Style:=[fsBold];
       Memo.HAlign:=haCenter;
       Memo.VAlign:=TfrxVAlign(vaCenter);
       Memo.Frame.Style:=fsSolid;
       Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
  end;

  if (left_first_kekv>0)
  then begin
            Memo:=TfrxMemoView.Create(PageHeader);
            Memo.CreateUniqueName;
            Memo.StretchMode:=smDontStretch;
            Memo.SetBounds(left_first_kekv,10,kekv_sumwidth,50);
            Memo.Text:='У тому числі за кодами економічної класифікації видатків';
            Memo.Font.Size:=k;
            Memo.Font.Style:=[fsBold];
            Memo.HAlign:=haCenter;
            Memo.VAlign:=TfrxVAlign(vaCenter);
            Memo.Frame.Style:=fsSolid;
            Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
  end;

  //Формируем группировку в таблице
  l:=0;i:=0;
  for j:=0 to n-1 do begin
    b1gh := TfrxGroupHeader.Create(Page);
    b1gh.CreateUniqueName;
    b1gh.Stretched:=true;
    b1gh.Condition:=frxDBDataSetV2.Name+'."'+GroupFields[j].fieldname+'"';
    b1gh.Top:=j*10;
    b1gh.Height:=10;

    Memo := TfrxMemoView.Create(b1gh);
    Memo.CreateUniqueName;
    Memo.StretchMode:=smMaxHeight;
    Memo.SetBounds(l, 0, trunc(pagewidth)-l, 10);
    Memo.Color:=RGB(235+j*2,235+j*2,170+(20-j*2)*j);

    Memo := TfrxMemoView.Create(b1gh);
    Memo.CreateUniqueName;
    Memo.StretchMode:=smMaxHeight;
    Memo.DataSet := frxDBDataSetV2;
    Memo.DataField := GroupFields[j].fieldname;
    Memo.SetBounds(l, 0, trunc(pagewidth)-l, 10);
    l:=l+colswidth[j];
    Memo.HAlign := haLeft;
    Memo.Frame.Typ:=[ftLeft, ftRight, ftTop];
    i:=0;
    for k:=0 to j do begin
      line:=TfrxLineView.Create(b1gh);
      line.StretchMode:=smMaxHeight;
      line.Left:=i;
      i:=i+colswidth[k];
      line.Top:=0;
      line.Height:=10;
      line.Width:=0;
    end;
  end;

  //Формируем саму таблицу
  DataBand := TfrxMasterData.Create(Page);
  DataBand.CreateUniqueName;
  DataBand.Stretched:=true;
  DataBand.DataSet := frxDBDataSetV2;
  DataBand.Top := n*10;
  DataBand.Height := 10;

  Memo := TfrxMemoView.Create(DataBand);
  Memo.CreateUniqueName;
  Memo.StretchMode:=smMaxHeight;
  Memo.Highlight.Condition:='<Line> mod 2 = 1';
  Memo.Highlight.Color:=RGB(245,245,245);
  Memo.SetBounds(l, 0, trunc(pagewidth)-l, 10);
  Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];

  l:=0;
  for j:=0 to m-1 do
  begin
          Memo := TfrxMemoView.Create(DataBand);
          Memo.CreateUniqueName;
          Memo.StretchMode:=smMaxHeight;
          Memo.DataSet := frxDBDataSetV2;
          Memo.DataField :=FieldstoTable[j].fieldname;
          Memo.SetBounds(i+l, 0, colswidth[j+n], 10);
          l:=l+colswidth[j+n];
          if FieldstoTable[j].alignment=taLeftJustify
          then Memo.HAlign := haLeft
          else if FieldstoTable[j].alignment=taRightJustify
               then Memo.HAlign := haRight
               else Memo.HAlign := haCenter;
          Memo.Frame.Typ:=[ftLeft];
  end;

  Band:=TfrxPageFooter.Create(Page);
  Band.CreateUniqueName;
  Band.SetBounds(0,0,pagewidth,20);

  Memo:=TfrxMemoView.Create(Band);
  Memo.Text:='[Page]';
  Memo.Font.Size:=12;
  Memo.HAlign:=haRight;
  Memo.SetBounds(pagewidth-40,0,40,20);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Font.Size:=6;
  Memo.Text:='[<Date>]  [<Time>]';
  Memo.SetBounds(0,10,80,10);


  Band:=TfrxReportSummary.Create(Page);
  Band.CreateUniqueName;
  Band.SetBounds(0,0,pagewidth,20);

  l:=50;
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='Виконавець:';
  Memo.Font.Size:=FontSize+2;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(l,50,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='________';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+100+20,50,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='(посада)';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+100+20,65,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='________';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+200+40,50,100,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='(підпис)';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+200+40,65,100,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='________';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+200+150, 50, 100, 10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='(ініціали і прізвище)';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+200+150, 65, 100, 10);

  r:=0;
  l:=500;
  if not (Page.Orientation=TPrinterOrientation(true))
  then begin
            r:=50;
            l:=50;
  end;

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='Перевірив:';
  Memo.Font.Size:=FontSize+2;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(l,50+r,100,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='________';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+100+20,50+r,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='(посада)';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+100+20,65+r,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='________';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+200+40,50+r,100,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='(підпис)';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+200+40,65+r,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='________';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+200+150, 50+r, 100, 10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='(ініціали і прізвище)';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+200+150, 65+r, 100, 10);
end;

procedure TAcardPrintReportForm.CreatePageUO1;
var
  n,m: short;
  FieldstoTable: array of FieldInfo;
  GroupFields: array of FieldInfo;
  Page: TfrxReportPage;
  RepSummary: TfrxReportSummary;
  DataBand: TfrxMasterData;
  Band: TfrxBand;
  PageHeader: TfrxPageHeader;
  Memo: TfrxMemoView;
  line: TfrxLineView;
  b1gh: TfrxGroupHeader;
  b1gf: TfrxGroupFooter;
  i,j,k,l,t,colwidth: short;
  gcolcount, colcount:Integer;
  pagewidth, sumwidth: extended;
  f: single;
  colswidth: array of short;
  tmp:FieldInfo;
  s:string;
begin
  Page := TfrxReportPage.Create(frxReport);
  Page.CreateUniqueName;
  Page.SetDefaults;
  if FontType<>'' then Page.Font.Name:=FontType;
  if FontSize<>0  then Page.Font.Size:=FontSize;
  Page.Orientation :=TPrinterOrientation(PageOrient);
  Page.LeftMargin  :=Margins[0];
  Page.TopMargin   :=Margins[1];
  Page.RightMargin :=Margins[2];
  Page.BottomMargin:=Margins[3];

  //Создаем бэнд заголовок отчета
  pagewidth:=Page.Width-3.85*(Margins[0]+Margins[2]);
  Band:=TfrxReportTitle.Create(Page);
  Band.CreateUniqueName;
  Band.Stretched:=true;
  Band.SetBounds(10,0,pagewidth,90);

  colcount:=0;
  gcolcount:=0;
  sumwidth:=0;
  for i:=0 to TfrmGetUrOMain(Self.Owner).PlanView.ColumnCount-1 do
  begin
       if (TfrmGetUrOMain(Self.Owner).PlanView.Columns[i].GroupIndex>-1)
       then begin
                 Inc(gcolcount);
                 sumwidth:=sumwidth+0;
       end
       else begin
                 Inc(colcount);
                 sumwidth:=sumwidth+TfrmGetUrOMain(Self.Owner).PlanView.Columns[i].Width;
       end;
  end;
  n:=gcolcount;
  m:=colcount;
  SetLength(colswidth,n+m);

  FieldstoTable:=nil;
  GroupFields  :=nil;

  SetLength(FieldstoTable,colcount);
  SetLength(GroupFields,gcolcount);

  colcount:=0;
  gcolcount:=0;

  for i:=0 to TfrmGetUrOMain(Self.Owner).PlanView.ColumnCount-1 do
  begin
       if (TfrmGetUrOMain(Self.Owner).PlanView.Columns[i].GroupIndex>-1)
       then begin
                  GroupFields[gcolcount].fieldname:=TfrmGetUrOMain(Self.Owner).PlanView.Columns[i].DataBinding.FieldName;
                  GroupFields[gcolcount].caption:=TfrmGetUrOMain(Self.Owner).PlanView.Columns[i].Caption;

                  GroupFields[gcolcount].alignment:=TcxTextEditProperties(TfrmGetUrOMain(Self.Owner).PlanView.Columns[i].Properties).Alignment.Horz;
                  GroupFields[gcolcount].width:=0;
                  if (TfrmGetUrOMain(Self.Owner).PlanView.Columns[i].SortOrder=soAscending)
                  then GroupFields[gcolcount].order:=1
                  else GroupFields[gcolcount].order:=0;

                  GroupFields[gcolcount].aggregative_function:='';

                  Inc(gcolcount);
       end
       else begin
                  FieldstoTable[colcount].fieldname:=TfrmGetUrOMain(Self.Owner).PlanView.Columns[i].DataBinding.FieldName;
                  FieldstoTable[colcount].caption:=TfrmGetUrOMain(Self.Owner).PlanView.Columns[i].Caption;
                  FieldstoTable[colcount].width:=(TfrmGetUrOMain(Self.Owner).PlanView.Columns[i].Width/sumwidth);

                  FieldstoTable[colcount].alignment:=TcxTextEditProperties(TfrmGetUrOMain(Self.Owner).PlanView.Columns[i].Properties).Alignment.Horz;

                  if (TfrmGetUrOMain(Self.Owner).PlanView.Columns[i].SortOrder=soAscending)
                  then FieldstoTable[colcount].order:=1
                  else FieldstoTable[colcount].order:=0;

                  if (TfrmGetUrOMain(Self.Owner).PlanView.Columns[i].Tag>0)
                  or (TfrmGetUrOMain(Self.Owner).PlanView.Columns[i].DataBinding.FieldName='KASSA_SUMMA')
                  then FieldstoTable[colcount].aggregative_function:='SUM';

                  if (TfrmGetUrOMain(Self.Owner).PlanView.Columns[i].DataBinding.FieldName='KASSA_SUMMA')
                  then FieldstoTable[colcount].order:=255
                  else FieldstoTable[colcount].order:=i;

                  Inc(colcount);
       end;
  end;

  //Сортируем массив колонок
  for i:=0 to m-1 do
  begin
       for j:=i+1 to m-1 do
       begin
            if (FieldstoTable[i].order>FieldstoTable[j].order)
            then begin
                      tmp.fieldname:=FieldstoTable[j].fieldname;
                      tmp.caption  :=FieldstoTable[j].caption;
                      tmp.alignment:=FieldstoTable[j].alignment;
                      tmp.width    :=FieldstoTable[j].width;
                      tmp.aggregative_function :=FieldstoTable[j].aggregative_function;
                      tmp.order    :=FieldstoTable[j].order;

                      FieldstoTable[j].fieldname:=FieldstoTable[i].fieldname;
                      FieldstoTable[j].caption  :=FieldstoTable[i].caption;
                      FieldstoTable[j].alignment:=FieldstoTable[i].alignment;
                      FieldstoTable[j].width    :=FieldstoTable[i].width;
                      FieldstoTable[j].aggregative_function:=FieldstoTable[i].aggregative_function;
                      FieldstoTable[j].order    :=FieldstoTable[i].order;

                      FieldstoTable[i].fieldname:=tmp.fieldname;
                      FieldstoTable[i].caption  :=tmp.caption;
                      FieldstoTable[i].alignment:=tmp.alignment;
                      FieldstoTable[i].width    :=tmp.width;
                      FieldstoTable[i].aggregative_function:=tmp.aggregative_function;
                      FieldstoTable[i].order    :=tmp.order;
            end;
       end;
  end;


  f:=0;
  k:=0;
  pagewidth:=Page.Width-3.85*(Margins[0]+Margins[2]);

  for i:=0 to n+m-1 do
  begin
       if (i>=n)
       then begin
                 if (FieldstoTable[i-n].width>0.0)
                 then begin
                        f:=f+FieldstoTable[i-n].width;
                        k:=k+1;
                 end;
       end
       else
           if (GroupFields[i].width>0.0)
           then begin
                     f:=f+GroupFields[i].width;
                     k:=k+1;
           end;
  end;

  if (f>1.01)
  then begin
            ShowMessage('wrong columns width'); exit;
  end;

  if (m+n)>k
  then begin
            colwidth:=trunc(pagewidth*(1-f)/(m+n-k));
            for i:=0 to n+m-1 do
            begin
                 if (i>=n)
                 then begin
                           if (FieldstoTable[i-n].width=0)
                           then colswidth[i]:=colwidth
                           else colswidth[i]:=trunc(FieldstoTable[i-n].width*pagewidth);
                 end
                 else begin
                           if GroupFields[i].width=0
                           then colswidth[i]:=colwidth
                           else colswidth[i]:=trunc(GroupFields[i].width*pagewidth);
                 end;
            end;
  end
  else begin
            for i:=0 to n+m-1
            do begin
                    if (i>=n)
                    then colswidth[i]:=trunc(FieldstoTable[i-n].width*pagewidth)
                    else colswidth[i]:=trunc(GroupFields[i].width*pagewidth);
            end;
  end;



  //Создаем мемо времени-даты на заголовке отчета
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Font.Size:=6;
  Memo.Text:='[<Date>]   [<Time>]';
  Memo.SetBounds(0,0,80,10);

  //Создаем ссылку на приказ
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='ЗАТВЕРДЖЕНО';
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haRight;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,10,pagewidth,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='наказом Державного казначейства України';
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haRight;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,20,pagewidth,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='від 6 жовтня 2000 р. № 100';
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haRight;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,30,pagewidth,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:=TfrmGetUrOMain(Self.Owner).organization;
  Memo.Frame.Typ:=[ftBottom];
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[fsUnderline];
  Memo.SetBounds(0,40,200,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='(назва установи)';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,50,200,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='Ідентифікаційний код за ЄДРПОУ';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[fsBold];
  Memo.SetBounds(0,60,200,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.Frame.Typ:=[ftLeft, ftRight, ftBottom, ftTop];
  Memo.Text:=TfrmGetUrOMain(Self.Owner).KOD_EDRPOU;
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,70,150,20);

  //Создаем мемо заголовка отчета
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='КНИГА ОБЛІКУ АСИГНУВАНЬ ТА ПРИЙНЯТИХ ЗОБОВ''ЯЗАНЬ';
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[fsbold];
  Memo.SetBounds(0,80+10,pagewidth,10);

  //Создаем мемо периода карточки на заголовке отчета
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='за '+ IntToStr(YearOf(TfrmGetUrOMain(Self.Owner).date_beg))+' рік.';
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,80+30,pagewidth,10);

  //Создаем мемо Обслуживаемой организации
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='Організація, що обслуговується: '+TfrmGetUrOMain(Self.Owner).organization;
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,80+40,pagewidth,10);

  //Создаем мемо КПК, тип коштів
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:=TfrmGetUrOMain(Self.Owner).Label1.Caption;
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,80+50,pagewidth,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:=TfrmGetUrOMain(Self.Owner).Label2.Caption;
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,80+60,pagewidth,10);



  pagewidth:=0;
  for i:=0 to n+m-1 do pagewidth:=pagewidth+colswidth[i];

  PageHeader:=TfrxPageHeader.Create(Page);
  PageHeader.Top:=0;
  PageHeader.Stretched:=true;
  PageHeader.Height:=10;
  PageHeader.Stretched:=true;

  //Формируем заголовок таблицы
  l:=0;
  k:=Page.Font.Size;
  for j:=n to n+m-1 do
  begin
       Memo:=TfrxMemoView.Create(PageHeader);
       Memo.CreateUniqueName;
       Memo.StretchMode:=smMaxHeight;
       Memo.SetBounds(l,10,colswidth[j],25);
       l:=l+colswidth[j];
       Memo.Text:=FieldstoTable[j-n].caption;
       Memo.Font.Size:=k;
       Memo.Font.Style:=[fsBold];
       Memo.HAlign:=haCenter;
       Memo.VAlign:=TfrxVAlign(vaCenter);
       Memo.Frame.Style:=fsSolid;
       Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
  end;

  //Формируем группировку в таблице
  l:=0;i:=0;
  for j:=0 to n-1 do begin
    b1gh := TfrxGroupHeader.Create(Page);
    b1gh.CreateUniqueName;
    b1gh.Stretched:=true;
    b1gh.Condition:=frxDBDataSet.Name+'."'+GroupFields[j].fieldname+'"';
    b1gh.Top:=j*10;
    b1gh.Height:=10;

    Memo := TfrxMemoView.Create(b1gh);
    Memo.CreateUniqueName;
    Memo.StretchMode:=smMaxHeight;
    Memo.SetBounds(l, 0, trunc(pagewidth)-l, 10);
    Memo.Color:=RGB(235+j*2,235+j*2,170+(20-j*2)*j);

    Memo := TfrxMemoView.Create(b1gh);
    Memo.CreateUniqueName;
    Memo.StretchMode:=smMaxHeight;
    Memo.DataSet := frxDBDataSet;
    Memo.DataField := GroupFields[j].fieldname;
    Memo.SetBounds(l, 0, trunc(pagewidth)-l, 10);
    l:=l+colswidth[j];
    Memo.HAlign := haLeft;
    Memo.Frame.Typ:=[ftLeft, ftRight, ftTop];
    i:=0;
    for k:=0 to j do begin
      line:=TfrxLineView.Create(b1gh);
      line.StretchMode:=smMaxHeight;
      line.Left:=i;
      i:=i+colswidth[k];
      line.Top:=0;
      line.Height:=10;
      line.Width:=0;
    end;
  end;

  //Формируем саму таблицу
  DataBand := TfrxMasterData.Create(Page);
  DataBand.CreateUniqueName;
  DataBand.Stretched:=true;
  DataBand.DataSet := frxDBDataSet;
  DataBand.Top := n*10;
  DataBand.Height := 10;

  Memo := TfrxMemoView.Create(DataBand);
  Memo.CreateUniqueName;
  Memo.StretchMode:=smMaxHeight;
  Memo.Highlight.Condition:='<Line> mod 2 = 1';
  Memo.Highlight.Color:=RGB(245,245,245);
  Memo.SetBounds(l, 0, trunc(pagewidth)-l, 10);
  Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];

  l:=0;
  for j:=0 to m-1 do
  begin
          Memo := TfrxMemoView.Create(DataBand);
          Memo.CreateUniqueName;
          Memo.StretchMode:=smMaxHeight;
          Memo.DataSet := frxDBDataSet;
          Memo.DataField :=FieldstoTable[j].fieldname;
          Memo.SetBounds(i+l, 0, colswidth[j+n], 10);
          l:=l+colswidth[j+n];
          if FieldstoTable[j].alignment=taLeftJustify
          then Memo.HAlign := haLeft
          else if FieldstoTable[j].alignment=taRightJustify
               then Memo.HAlign := haRight
               else Memo.HAlign := haCenter;
          Memo.Frame.Typ:=[ftLeft];
  end;

  Band:=TfrxPageFooter.Create(Page);
  Band.CreateUniqueName;
  Band.SetBounds(0,0,pagewidth,20);

  Memo:=TfrxMemoView.Create(Band);
  Memo.Text:='[Page]';
  Memo.Font.Size:=12;
  Memo.HAlign:=haRight;
  Memo.SetBounds(pagewidth-40,0,40,20);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Font.Size:=6;
  Memo.Text:='[<Date>]  [<Time>]';
  Memo.SetBounds(0,10,80,10);
end;

procedure TAcardPrintReportForm.CreatePageUO2;
var
  n,m: short;
  FieldstoTable: array of FieldInfo;
  GroupFields: array of FieldInfo;
  Page: TfrxReportPage;
  RepSummary: TfrxReportSummary;
  DataBand: TfrxMasterData;
  Band: TfrxBand;
  PageHeader: TfrxPageHeader;
  Memo: TfrxMemoView;
  line: TfrxLineView;
  b1gh: TfrxGroupHeader;
  b1gf: TfrxGroupFooter;
  i,j,k,l,t,colwidth: short;
  gcolcount, colcount:Integer;
  pagewidth, sumwidth: extended;
  f: single;
  colswidth: array of short;
  tmp:FieldInfo;
  s:string;
begin
  Page := TfrxReportPage.Create(frxReport);
  Page.CreateUniqueName;
  Page.SetDefaults;
  if FontType<>'' then Page.Font.Name:=FontType;
  if FontSize<>0  then Page.Font.Size:=FontSize;
  Page.Orientation :=TPrinterOrientation(PageOrient);
  Page.LeftMargin  :=Margins[0];
  Page.TopMargin   :=Margins[1];
  Page.RightMargin :=Margins[2];
  Page.BottomMargin:=Margins[3];

  //Создаем бэнд заголовок отчета
  pagewidth:=Page.Width-3.85*(Margins[0]+Margins[2]);
  Band:=TfrxReportTitle.Create(Page);
  Band.CreateUniqueName;
  Band.Stretched:=true;
  Band.SetBounds(10,0,pagewidth,90);

  colcount:=0;
  gcolcount:=0;
  sumwidth:=0;
  for i:=0 to TfrmGetAssignMain(Self.Owner).FactView.ColumnCount-1 do
  begin
       if (TfrmGetUrOMain(Self.Owner).FactView.Columns[i].GroupIndex>-1)
       then begin
                 Inc(gcolcount);
                 sumwidth:=sumwidth+0;
       end
       else begin
                 Inc(colcount);
                 sumwidth:=sumwidth+TfrmGetUrOMain(Self.Owner).FactView.Columns[i].Width;
       end;
  end;
  n:=gcolcount;
  m:=colcount;
  SetLength(colswidth,n+m);

  FieldstoTable:=nil;
  GroupFields  :=nil;

  SetLength(FieldstoTable,colcount);
  SetLength(GroupFields,gcolcount);

  colcount:=0;
  gcolcount:=0;

  for i:=0 to TfrmGetUrOMain(Self.Owner).FactView.ColumnCount-1 do
  begin
       if (TfrmGetUrOMain(Self.Owner).FactView.Columns[i].GroupIndex>-1)
       then begin
                  GroupFields[gcolcount].fieldname:=TfrmGetUrOMain(Self.Owner).FactView.Columns[i].DataBinding.FieldName;
                  GroupFields[gcolcount].caption:=TfrmGetUrOMain(Self.Owner).FactView.Columns[i].Caption;

                  GroupFields[gcolcount].alignment:=TcxTextEditProperties(TfrmGetUrOMain(Self.Owner).FactView.Columns[i].Properties).Alignment.Horz;
                  GroupFields[gcolcount].width:=0;
                  if (TfrmGetUrOMain(Self.Owner).FactView.Columns[i].SortOrder=soAscending)
                  then GroupFields[gcolcount].order:=1
                  else GroupFields[gcolcount].order:=0;

                  GroupFields[gcolcount].aggregative_function:='';

                  Inc(gcolcount);
       end
       else begin
                  FieldstoTable[colcount].fieldname:=TfrmGetUrOMain(Self.Owner).FactView.Columns[i].DataBinding.FieldName;
                  FieldstoTable[colcount].caption:=TfrmGetUrOMain(Self.Owner).FactView.Columns[i].Caption;
                  FieldstoTable[colcount].width:=(TfrmGetUrOMain(Self.Owner).FactView.Columns[i].Width/sumwidth);

                  FieldstoTable[colcount].alignment:=TcxTextEditProperties(TfrmGetUrOMain(Self.Owner).FactView.Columns[i].Properties).Alignment.Horz;

                  if (TfrmGetUrOMain(Self.Owner).FactView.Columns[i].SortOrder=soAscending)
                  then FieldstoTable[colcount].order:=1
                  else FieldstoTable[colcount].order:=0;

                  if (TfrmGetUrOMain(Self.Owner).FactView.Columns[i].Tag>0)
                  or (TfrmGetUrOMain(Self.Owner).FactView.Columns[i].DataBinding.FieldName='KASSA_SUMMA')
                  then FieldstoTable[colcount].aggregative_function:='SUM';

                  if (TfrmGetUrOMain(Self.Owner).FactView.Columns[i].DataBinding.FieldName='KASSA_SUMMA')
                  then FieldstoTable[colcount].order:=255
                  else FieldstoTable[colcount].order:=i;

                  Inc(colcount);
       end;
  end;

  //Сортируем массив колонок
  for i:=0 to m-1 do
  begin
       for j:=i+1 to m-1 do
       begin
            if (FieldstoTable[i].order>FieldstoTable[j].order)
            then begin
                      tmp.fieldname:=FieldstoTable[j].fieldname;
                      tmp.caption  :=FieldstoTable[j].caption;
                      tmp.alignment:=FieldstoTable[j].alignment;
                      tmp.width    :=FieldstoTable[j].width;
                      tmp.aggregative_function :=FieldstoTable[j].aggregative_function;
                      tmp.order    :=FieldstoTable[j].order;

                      FieldstoTable[j].fieldname:=FieldstoTable[i].fieldname;
                      FieldstoTable[j].caption  :=FieldstoTable[i].caption;
                      FieldstoTable[j].alignment:=FieldstoTable[i].alignment;
                      FieldstoTable[j].width    :=FieldstoTable[i].width;
                      FieldstoTable[j].aggregative_function:=FieldstoTable[i].aggregative_function;
                      FieldstoTable[j].order    :=FieldstoTable[i].order;

                      FieldstoTable[i].fieldname:=tmp.fieldname;
                      FieldstoTable[i].caption  :=tmp.caption;
                      FieldstoTable[i].alignment:=tmp.alignment;
                      FieldstoTable[i].width    :=tmp.width;
                      FieldstoTable[i].aggregative_function:=tmp.aggregative_function;
                      FieldstoTable[i].order    :=tmp.order;
            end;
       end;
  end;


  f:=0;
  k:=0;
  pagewidth:=Page.Width-3.85*(Margins[0]+Margins[2]);

  for i:=0 to n+m-1 do
  begin
       if (i>=n)
       then begin
                 if (FieldstoTable[i-n].width>0.0)
                 then begin
                        f:=f+FieldstoTable[i-n].width;
                        k:=k+1;
                 end;
       end
       else
           if (GroupFields[i].width>0.0)
           then begin
                     f:=f+GroupFields[i].width;
                     k:=k+1;
           end;
  end;

  if (f>1.01)
  then begin
            ShowMessage('wrong columns width'); exit;
  end;

  if (m+n)>k
  then begin
            colwidth:=trunc(pagewidth*(1-f)/(m+n-k));
            for i:=0 to n+m-1 do
            begin
                 if (i>=n)
                 then begin
                           if (FieldstoTable[i-n].width=0)
                           then colswidth[i]:=colwidth
                           else colswidth[i]:=trunc(FieldstoTable[i-n].width*pagewidth);
                 end
                 else begin
                           if GroupFields[i].width=0
                           then colswidth[i]:=colwidth
                           else colswidth[i]:=trunc(GroupFields[i].width*pagewidth);
                 end;
            end;
  end
  else begin
            for i:=0 to n+m-1
            do begin
                    if (i>=n)
                    then colswidth[i]:=trunc(FieldstoTable[i-n].width*pagewidth)
                    else colswidth[i]:=trunc(GroupFields[i].width*pagewidth);
            end;
  end;



  //Создаем мемо времени-даты на заголовке отчета
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Font.Size:=6;
  Memo.Text:='[<Date>]   [<Time>]';
  Memo.SetBounds(0,0,80,10);

  pagewidth:=0;
  for i:=0 to n+m-1 do pagewidth:=pagewidth+colswidth[i];

  PageHeader:=TfrxPageHeader.Create(Page);
  PageHeader.Top:=0;
  PageHeader.Stretched:=true;
  PageHeader.Height:=10;
  PageHeader.Stretched:=true;

  //Формируем заголовок таблицы
  l:=0;
  k:=Page.Font.Size;
  for j:=n to n+m-1 do
  begin
       Memo:=TfrxMemoView.Create(PageHeader);
       Memo.CreateUniqueName;
       Memo.StretchMode:=smMaxHeight;
       Memo.SetBounds(l,10,colswidth[j],25);
       l:=l+colswidth[j];
       Memo.Text:=FieldstoTable[j-n].caption;
       Memo.Font.Size:=k;
       Memo.Font.Style:=[fsBold];
       Memo.HAlign:=haCenter;
       Memo.VAlign:=TfrxVAlign(vaCenter);
       Memo.Frame.Style:=fsSolid;
       Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
  end;

  //Формируем группировку в таблице
  l:=0;i:=0;
  for j:=0 to n-1 do begin
    b1gh := TfrxGroupHeader.Create(Page);
    b1gh.CreateUniqueName;
    b1gh.Stretched:=true;
    b1gh.Condition:=frxDBDataSetV2.Name+'."'+GroupFields[j].fieldname+'"';
    b1gh.Top:=j*10;
    b1gh.Height:=10;

    Memo := TfrxMemoView.Create(b1gh);
    Memo.CreateUniqueName;
    Memo.StretchMode:=smMaxHeight;
    Memo.SetBounds(l, 0, trunc(pagewidth)-l, 10);
    Memo.Color:=RGB(235+j*2,235+j*2,170+(20-j*2)*j);

    Memo := TfrxMemoView.Create(b1gh);
    Memo.CreateUniqueName;
    Memo.StretchMode:=smMaxHeight;
    Memo.DataSet := frxDBDataSetV2;
    Memo.DataField := GroupFields[j].fieldname;
    Memo.SetBounds(l, 0, trunc(pagewidth)-l, 10);
    l:=l+colswidth[j];
    Memo.HAlign := haLeft;
    Memo.Frame.Typ:=[ftLeft, ftRight, ftTop];
    i:=0;
    for k:=0 to j do begin
      line:=TfrxLineView.Create(b1gh);
      line.StretchMode:=smMaxHeight;
      line.Left:=i;
      i:=i+colswidth[k];
      line.Top:=0;
      line.Height:=10;
      line.Width:=0;
    end;
  end;

  //Формируем саму таблицу
  DataBand := TfrxMasterData.Create(Page);
  DataBand.CreateUniqueName;
  DataBand.Stretched:=true;
  DataBand.DataSet := frxDBDataSetV2;
  DataBand.Top := n*10;
  DataBand.Height := 10;

  Memo := TfrxMemoView.Create(DataBand);
  Memo.CreateUniqueName;
  Memo.StretchMode:=smMaxHeight;
  Memo.Highlight.Condition:='<Line> mod 2 = 1';
  Memo.Highlight.Color:=RGB(245,245,245);
  Memo.SetBounds(l, 0, trunc(pagewidth)-l, 10);
  Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];

  l:=0;
  for j:=0 to m-1 do
  begin
          Memo := TfrxMemoView.Create(DataBand);
          Memo.CreateUniqueName;
          Memo.StretchMode:=smMaxHeight;
          Memo.DataSet := frxDBDataSetV2;
          Memo.DataField :=FieldstoTable[j].fieldname;
          Memo.SetBounds(i+l, 0, colswidth[j+n], 10);
          l:=l+colswidth[j+n];
          if FieldstoTable[j].alignment=taLeftJustify
          then Memo.HAlign := haLeft
          else if FieldstoTable[j].alignment=taRightJustify
               then Memo.HAlign := haRight
               else Memo.HAlign := haCenter;
          Memo.Frame.Typ:=[ftLeft];
  end;

  Band:=TfrxPageFooter.Create(Page);
  Band.CreateUniqueName;
  Band.SetBounds(0,0,pagewidth,20);

  Memo:=TfrxMemoView.Create(Band);
  Memo.Text:='[Page]';
  Memo.Font.Size:=12;
  Memo.HAlign:=haRight;
  Memo.SetBounds(pagewidth-40,0,40,20);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Font.Size:=6;
  Memo.Text:='[<Date>]  [<Time>]';
  Memo.SetBounds(0,10,80,10);


  Band:=TfrxReportSummary.Create(Page);
  Band.CreateUniqueName;
  Band.SetBounds(0,0,pagewidth,20);

  l:=50;
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='Виконавець:';
  Memo.Font.Size:=FontSize+2;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(l,50,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='________';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+100+20,50,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='(посада)';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+100+20,65,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='________';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+200+40,50,100,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='(підпис)';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+200+40,65,100,10);


  l:=400;
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='Перевірив:';
  Memo.Font.Size:=FontSize+2;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(l,50,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='________';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+100+20,50,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='(посада)';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+100+20,65,100,10);


  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='________';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+200+40,50,100,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='(підпис)';
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(l+200+40,65,100,10);
end;

end.
