unit ACardExPrintReport;

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
  Printers, Menus,dxStatusBar;

type
    FieldInfo = record
      fieldname: string;
      caption: string;
      alignment: TAlignment;
      order: short;
      corder: short;
      width: single;
      aggregative_function: string;
    end;

  TAcExPrintReport = class(TForm)
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

    procedure CreatePageF1;

  public
      Margins: array of short;
      PageOrient: boolean;
      FontType: string;
      FontSize: short;
      FTypeForm:Integer;
      constructor Create(AOwner:TComponent; TypeForm:Integer);reintroduce;
  end;

implementation

uses UFormKassaResults, UFormFactResults;

{$R *.dfm}

procedure TAcExPrintReport.FormCreate(Sender: TObject);
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

procedure TAcExPrintReport.FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure TAcExPrintReport.cxButton2Click(Sender: TObject);
begin
  ModalResult:=mrcancel;
end;

procedure TAcExPrintReport.Panel1Click(Sender: TObject);
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

procedure TAcExPrintReport.OnKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
    begin
      key := #0;
      beep;
    end;
end;

procedure TAcExPrintReport.cxButton1Click(Sender: TObject);
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

procedure TAcExPrintReport.ReportCreate;
begin

  if (FTypeForm=1)
  then begin
            frxDBDataSet.DataSource:=TfrmGetResults(Self.Owner).PlanView.DataController.DataSource;

            frxReport.Clear;
            frxReport.DataSets.Add(frxDBDataSet);

            CreatePage1;
  end;

  if (FTypeForm=2)
  then begin
            frxDBDataSet.DataSource:=TfrmGetFactResults(Self.Owner).PlanView.DataController.DataSource;

            frxReport.Clear;
            frxReport.DataSets.Add(frxDBDataSet);

            CreatePageF1;
  end;


  frxReport.ShowReport();
end;

procedure TAcExPrintReport.EnterExecute(Sender: TObject);
begin
  cxButton1Click(self);
end;

procedure TAcExPrintReport.EscExecute(Sender: TObject);
begin
  ModalResult:=mrcancel;
end;

procedure TAcExPrintReport.CreatePage1;
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
  str:string;
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
  Band.SetBounds(10,0,pagewidth,80);

  colcount:=0;
  gcolcount:=0;
  sumwidth:=0;
  for i:=0 to TfrmGetResults(Self.Owner).PlanView.ColumnCount-1 do
  begin
       if (TfrmGetResults(Self.Owner).PlanView.Columns[i].GroupIndex>-1)
       then begin
                 Inc(gcolcount);
                 sumwidth:=sumwidth+0;//TfrmGetKassaRasx(Self.Owner).PlanView.Columns[i].Width;
       end
       else begin
                 Inc(colcount);
                 sumwidth:=sumwidth+TfrmGetResults(Self.Owner).PlanView.Columns[i].Width;
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

  for i:=0 to TfrmGetResults(Self.Owner).PlanView.ColumnCount-1 do
  begin
       if (TfrmGetResults(Self.Owner).PlanView.Columns[i].GroupIndex>-1)
       then begin
                  GroupFields[gcolcount].fieldname:=TfrmGetResults(Self.Owner).PlanView.Columns[i].DataBinding.FieldName;
                  GroupFields[gcolcount].caption:=TfrmGetResults(Self.Owner).PlanView.Columns[i].Caption;

                  GroupFields[gcolcount].alignment:=TcxTextEditProperties(TfrmGetResults(Self.Owner).PlanView.Columns[i].Properties).Alignment.Horz;
                  GroupFields[gcolcount].width:=0;;
                  if (TfrmGetResults(Self.Owner).PlanView.Columns[i].SortOrder=soAscending)
                  then GroupFields[gcolcount].order:=1
                  else GroupFields[gcolcount].order:=0;

                  GroupFields[gcolcount].aggregative_function:='';

                  Inc(gcolcount);
       end
       else begin
                  FieldstoTable[colcount].fieldname:=TfrmGetResults(Self.Owner).PlanView.Columns[i].DataBinding.FieldName;
                  FieldstoTable[colcount].caption  :=TfrmGetResults(Self.Owner).PlanView.Columns[i].Caption;
                  FieldstoTable[colcount].width    :=(TfrmGetResults(Self.Owner).PlanView.Columns[i].Width/sumwidth);

                  if TfrmGetResults(Self.Owner).PlanView.Columns[i].Properties<>nil
                  then FieldstoTable[colcount].alignment:=TcxTextEditProperties(TfrmGetResults(Self.Owner).PlanView.Columns[i].Properties).Alignment.Horz
                  else FieldstoTable[colcount].alignment:=taCenter;

                  if (TfrmGetResults(Self.Owner).PlanView.Columns[i].SortOrder=soAscending)
                  then FieldstoTable[colcount].order:=1
                  else FieldstoTable[colcount].order:=0;

                  if (TfrmGetResults(Self.Owner).PlanView.Columns[i].GroupIndex>-1)
                  or (pos('DATE',TfrmGetResults(Self.Owner).PlanView.Columns[i].DataBinding.FieldName)=0)
                  then FieldstoTable[colcount].aggregative_function:='SUM';

                  if (pos('REST',TfrmGetResults(Self.Owner).PlanView.Columns[i].DataBinding.FieldName)>0)
                  then FieldstoTable[colcount].corder:=255
                  else FieldstoTable[colcount].corder:=i;

                  Inc(colcount);
       end;
  end;

  //Сортируем массив колонок
  for i:=0 to m-1 do
  begin
       for j:=i+1 to m-1 do
       begin
            if (FieldstoTable[i].corder>FieldstoTable[j].corder)
            then begin
                      tmp.fieldname:=FieldstoTable[j].fieldname;
                      tmp.caption  :=FieldstoTable[j].caption;
                      tmp.alignment:=FieldstoTable[j].alignment;
                      tmp.width    :=FieldstoTable[j].width;
                      tmp.aggregative_function :=FieldstoTable[j].aggregative_function;
                      tmp.order    :=FieldstoTable[j].order;
                      tmp.corder    :=FieldstoTable[j].corder;

                      FieldstoTable[j].fieldname:=FieldstoTable[i].fieldname;
                      FieldstoTable[j].caption  :=FieldstoTable[i].caption;
                      FieldstoTable[j].alignment:=FieldstoTable[i].alignment;
                      FieldstoTable[j].width    :=FieldstoTable[i].width;
                      FieldstoTable[j].aggregative_function:=FieldstoTable[i].aggregative_function;
                      FieldstoTable[j].order    :=FieldstoTable[i].order;
                      FieldstoTable[j].corder    :=FieldstoTable[i].corder;

                      FieldstoTable[i].fieldname:=tmp.fieldname;
                      FieldstoTable[i].caption  :=tmp.caption;
                      FieldstoTable[i].alignment:=tmp.alignment;
                      FieldstoTable[i].width    :=tmp.width;
                      FieldstoTable[i].aggregative_function:=tmp.aggregative_function;
                      FieldstoTable[i].order    :=tmp.order;
                      FieldstoTable[i].corder    :=tmp.corder;
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

  //Создаем мемо заголовка отчета
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='ЗВІТ З ОБЛІКУ КАСОВОГО РУХУ КОШТІВ';
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[fsbold];
  Memo.SetBounds(0,10,pagewidth,20);

  //Создаем мемо периода карточки на заголовке отчета
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='за '+ DateToStr(TfrmGetResults(Self.Owner).date_beg)+' - '+DateToStr(TfrmGetResults(Self.Owner).date_end);
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,30,pagewidth,10);

  //Создаем мемо Обслуживаемой организации
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='Організація, що обслуговується: '+TfrmGetResults(Self.Owner).organization;
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,40,pagewidth,10);

  //Создаем мемо КПК, тип коштів
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:=TfrmGetResults(Self.Owner).Label1.Caption;
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,50,pagewidth,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:=TfrmGetResults(Self.Owner).Label2.Caption;
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,60,pagewidth,10);

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

  l:=0;i:=0;
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

  //Формируем суммы по группировкам
  i:=0;

  b1gf:=TfrxGroupFooter.Create(Page);
  b1gf.CreateUniqueName;
  b1gf.Stretched:=true;
  b1gf.Top:=10*(2*n-j+2);
  b1gf.Height:=0;

  l:=0;
  for j:=0 to m-1 do
  begin
       if length(FieldstoTable[j].aggregative_function)>0
       then begin
                  b1gf.Height:=10;
                  Memo:=TfrxMemoView.Create(b1gf);
                  Memo.CreateUniqueName;
                  Memo.StretchMode:=smMaxHeight;
                  str:='['+FieldstoTable[j].aggregative_function+'(';
                  if FieldstoTable[j].aggregative_function<>'COUNT'
                  then Memo.Text:=str+'<'+frxDBDataSet.Name+'."'+FieldstoTable[j].fieldname+'">,'+DataBand.Name+')]'
                  else Memo.Text:=str+DataBand.Name+')]';
                  Memo.Font.Style:=[fsBold];
                  Memo.DisplayFormat.Kind:=fkNumeric;
                  Memo.DisplayFormat.FormatStr:='%2.2f';
                  Memo.DisplayFormat.DecimalSeparator:=',';
                  Memo.HAlign := haRight;
                  Memo.SetBounds(i+l, 0, colswidth[j+n], 10);
                  Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
       end;
       l:=l+colswidth[j+n];
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


constructor TAcExPrintReport.Create(AOwner: TComponent;
  TypeForm: Integer);
begin
     inherited Create(AOwner);
     FTypeForm:=TypeForm;
end;

procedure TAcExPrintReport.CreatePageF1;
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
  str:string;
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
  Band.SetBounds(10,0,pagewidth,80);

  colcount:=0;
  gcolcount:=0;
  sumwidth:=0;
  for i:=0 to TfrmGetFactResults(Self.Owner).PlanView.ColumnCount-1 do
  begin
       if (TfrmGetFactResults(Self.Owner).PlanView.Columns[i].GroupIndex>-1)
       then begin
                 Inc(gcolcount);
                 sumwidth:=sumwidth+0;
       end
       else begin
                 Inc(colcount);
                 sumwidth:=sumwidth+TfrmGetFactResults(Self.Owner).PlanView.Columns[i].Width;
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

  for i:=0 to TfrmGetFactResults(Self.Owner).PlanView.ColumnCount-1 do
  begin
       if (TfrmGetFactResults(Self.Owner).PlanView.Columns[i].GroupIndex>-1)
       then begin
                  GroupFields[gcolcount].fieldname:=TfrmGetFactResults(Self.Owner).PlanView.Columns[i].DataBinding.FieldName;
                  GroupFields[gcolcount].caption:=TfrmGetFactResults(Self.Owner).PlanView.Columns[i].Caption;

                  GroupFields[gcolcount].alignment:=TcxTextEditProperties(TfrmGetFactResults(Self.Owner).PlanView.Columns[i].Properties).Alignment.Horz;
                  GroupFields[gcolcount].width:=0;;
                  if (TfrmGetResults(Self.Owner).PlanView.Columns[i].SortOrder=soAscending)
                  then GroupFields[gcolcount].order:=1
                  else GroupFields[gcolcount].order:=0;

                  GroupFields[gcolcount].aggregative_function:='';

                  Inc(gcolcount);
       end
       else begin
                  FieldstoTable[colcount].fieldname:=TfrmGetFactResults(Self.Owner).PlanView.Columns[i].DataBinding.FieldName;
                  FieldstoTable[colcount].caption  :=TfrmGetFactResults(Self.Owner).PlanView.Columns[i].Caption;
                  FieldstoTable[colcount].width    :=(TfrmGetFactResults(Self.Owner).PlanView.Columns[i].Width/sumwidth);

                  if TfrmGetResults(Self.Owner).PlanView.Columns[i].Properties<>nil
                  then FieldstoTable[colcount].alignment:=TcxTextEditProperties(TfrmGetFactResults(Self.Owner).PlanView.Columns[i].Properties).Alignment.Horz
                  else FieldstoTable[colcount].alignment:=taCenter;

                  if (TfrmGetFactResults(Self.Owner).PlanView.Columns[i].SortOrder=soAscending)
                  then FieldstoTable[colcount].order:=1
                  else FieldstoTable[colcount].order:=0;

                  if  ((TfrmGetFactResults(Self.Owner).PlanView.Columns[i].DataBinding.FieldName<>'ksch_f')
                  and  (TfrmGetFactResults(Self.Owner).PlanView.Columns[i].DataBinding.FieldName<>'text'))
                  then FieldstoTable[colcount].aggregative_function:='SUM';

                  if (pos('REST',TfrmGetFactResults(Self.Owner).PlanView.Columns[i].DataBinding.FieldName)>0)
                  then FieldstoTable[colcount].corder:=255
                  else FieldstoTable[colcount].corder:=i;

                  Inc(colcount);
       end;
  end;

  //Сортируем массив колонок
  for i:=0 to m-1 do
  begin
       for j:=i+1 to m-1 do
       begin
            if (FieldstoTable[i].corder>FieldstoTable[j].corder)
            then begin
                      tmp.fieldname:=FieldstoTable[j].fieldname;
                      tmp.caption  :=FieldstoTable[j].caption;
                      tmp.alignment:=FieldstoTable[j].alignment;
                      tmp.width    :=FieldstoTable[j].width;
                      tmp.aggregative_function :=FieldstoTable[j].aggregative_function;
                      tmp.order    :=FieldstoTable[j].order;
                      tmp.corder    :=FieldstoTable[j].corder;

                      FieldstoTable[j].fieldname:=FieldstoTable[i].fieldname;
                      FieldstoTable[j].caption  :=FieldstoTable[i].caption;
                      FieldstoTable[j].alignment:=FieldstoTable[i].alignment;
                      FieldstoTable[j].width    :=FieldstoTable[i].width;
                      FieldstoTable[j].aggregative_function:=FieldstoTable[i].aggregative_function;
                      FieldstoTable[j].order    :=FieldstoTable[i].order;
                      FieldstoTable[j].corder    :=FieldstoTable[i].corder;

                      FieldstoTable[i].fieldname:=tmp.fieldname;
                      FieldstoTable[i].caption  :=tmp.caption;
                      FieldstoTable[i].alignment:=tmp.alignment;
                      FieldstoTable[i].width    :=tmp.width;
                      FieldstoTable[i].aggregative_function:=tmp.aggregative_function;
                      FieldstoTable[i].order    :=tmp.order;
                      FieldstoTable[i].corder    :=tmp.corder;
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

  //Создаем мемо заголовка отчета
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='ЗВІТ З ОБЛІКУ ФАКТИЧНОГО РУХУ КОШТІВ';
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[fsbold];
  Memo.SetBounds(0,10,pagewidth,20);

  //Создаем мемо периода карточки на заголовке отчета
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='за '+ DateToStr(TfrmGetFactResults(Self.Owner).date_beg)+' - '+DateToStr(TfrmGetFactResults(Self.Owner).date_end);
  Memo.Font.Size:=trunc(FontSize*1.1);
  Memo.HAlign:=haCenter;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,30,pagewidth,10);

  //Создаем мемо Обслуживаемой организации
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:='Організація, що обслуговується: '+TfrmGetFactResults(Self.Owner).organization;
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,40,pagewidth,10);

  //Создаем мемо КПК, тип коштів
  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:=TfrmGetFactResults(Self.Owner).Label1.Caption;
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,50,pagewidth,10);

  Memo:=TfrxMemoView.Create(Band);
  Memo.StretchMode:=smMaxHeight;
  Memo.Text:=TfrmGetFactResults(Self.Owner).Label2.Caption;
  Memo.Font.Size:=FontSize;
  Memo.HAlign:=haLeft;
  Memo.Font.Style:=[];
  Memo.SetBounds(0,60,pagewidth,10);

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

  l:=0;i:=0;
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

  //Формируем суммы по группировкам
  i:=0;

  b1gf:=TfrxGroupFooter.Create(Page);
  b1gf.CreateUniqueName;
  b1gf.Stretched:=true;
  b1gf.Top:=10*(2*n-j+2);
  b1gf.Height:=0;

  l:=0;
  for j:=0 to m-1 do
  begin
       if length(FieldstoTable[j].aggregative_function)>0
       then begin
                  b1gf.Height:=10;
                  Memo:=TfrxMemoView.Create(b1gf);
                  Memo.CreateUniqueName;
                  Memo.StretchMode:=smMaxHeight;
                  str:='['+FieldstoTable[j].aggregative_function+'(';
                  if FieldstoTable[j].aggregative_function<>'COUNT'
                  then Memo.Text:=str+'<'+frxDBDataSet.Name+'."'+FieldstoTable[j].fieldname+'">,'+DataBand.Name+')]'
                  else Memo.Text:=str+DataBand.Name+')]';
                  Memo.Font.Style:=[fsBold];
                  Memo.DisplayFormat.Kind:=fkNumeric;
                  Memo.DisplayFormat.FormatStr:='%2.2f';
                  Memo.DisplayFormat.DecimalSeparator:=',';
                  Memo.HAlign := haRight;
                  Memo.SetBounds(i+l, 0, colswidth[j+n], 10);
                  Memo.Frame.Typ:=[ftLeft, ftRight, ftTop, ftBottom];
       end;
       l:=l+colswidth[j+n];
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


end.
