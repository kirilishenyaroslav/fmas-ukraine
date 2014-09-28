unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, StdCtrls, cxRadioGroup, cxGroupBox, cxCheckBox,
  cxLookAndFeelPainters, ExtCtrls, cxButtons, cxShellDlgs,
  cxShellBrowserDialog, cxListBox, Menus, ShellApi, ClipBrd, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, RxMemDS;

type
  TForm1 = class(TForm)
    ScriptFileEdit: TcxButtonEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    ScriptsNumPathEdit: TcxButtonEdit;
    cxGroupBox1: TcxGroupBox;
    rbMetadata: TcxRadioButton;
    rbData: TcxRadioButton;
    ScriptNameEdit: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    OpenDialog1: TOpenDialog;
    cxLabel4: TcxLabel;
    ScriptsPathEdit: TcxButtonEdit;
    cxLabel5: TcxLabel;
    lbScripts: TcxListBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Notepad1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    cxLabel6: TcxLabel;
    CommentEdit: TcxTextEdit;
    cxButton4: TcxButton;
    rbIndex: TcxRadioButton;
    rbModules: TcxRadioButton;
    DataSource1: TDataSource;
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1RxMemoryData1Field1: TIntegerField;
    RxMemoryData1RxMemoryData1Field2: TStringField;
    RxMemoryData1RxMemoryData1Field3: TIntegerField;
    grdProjects: TcxGrid;
    grdProjectsDBTableView1: TcxGridDBTableView;
    cheked: TcxGridDBColumn;
    grdProjectsDBTableView1DBColumn1: TcxGridDBColumn;
    grdProjectsDBTableView1DBColumn2: TcxGridDBColumn;
    grdProjectsLevel1: TcxGridLevel;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    RxMemoryData1RxMemoryData1Field4: TStringField;
    grdProjectsDBTableView1DBColumn3: TcxGridDBColumn;
    N4: TMenuItem;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    procedure FormCreate(Sender: TObject);
    procedure rbMetadataClick(Sender: TObject);
    procedure rbDataClick(Sender: TObject);
    procedure cbBuhgClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure ScriptFileEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ScriptsPathEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ScriptsNumPathEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure N1Click(Sender: TObject);
    procedure Notepad1Click(Sender: TObject);
    procedure lbScriptsDblClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure lbScriptsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxRadioButton1Click(Sender: TObject);
    procedure CommentEditPropertiesChange(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure cxButton7Click(Sender: TObject);
    procedure rbIndexClick(Sender: TObject);
    procedure rbModulesClick(Sender: TObject);
    procedure grdProjectsDBTableView1EditChanged(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
    procedure N4Click(Sender: TObject);
  private
    function BrowseDialog (const Title: string; const Flag: integer): string;
    { Private declarations }
  public
    procedure MakeScriptName;
    procedure GetLastScriptNum;
    procedure FindTodayScripts;
  end;

var
  Form1: TForm1;
  LastNum : Integer = 1;
  Familiya : string = '';
  ProjectCount : Integer;
  ProjectName: array of string;
  ProjectKey: array of string;
  sort_invers : Boolean = True;

implementation

uses Math, IniFiles, ShlObj;

{$R *.dfm}

{ TForm1 }

function TForm1.BrowseDialog
 (const Title: string; const Flag: integer): string;
var
  lpItemID : PItemIDList;
  BrowseInfo : TBrowseInfo;
  DisplayName : array[0..MAX_PATH] of char;
  TempPath : array[0..MAX_PATH] of char;
begin
  Result:='';
  FillChar(BrowseInfo, sizeof(TBrowseInfo), #0);
  with BrowseInfo do begin
    hwndOwner := Application.Handle;
    pszDisplayName := @DisplayName;
    lpszTitle := PChar(Title);
    ulFlags := Flag;
  end;
  lpItemID := SHBrowseForFolder(BrowseInfo);
  if lpItemId <> nil then begin
    SHGetPathFromIDList(lpItemID, TempPath);
    Result := TempPath;
    GlobalFreePtr(lpItemID);
  end;
end;




procedure TForm1.MakeScriptName;
var
  s : string;
  i: integer;
  project : string;
begin
  project := RxMemoryData1.FieldByName('RxMemoryData1Field4').Value;
  begin
    RxMemoryData1.Locate('RxMemoryData1Field4',RxMemoryData1.FieldByName('RxMemoryData1Field4').Value,[])  ;
    RxMemoryData1.Edit;
    if RxMemoryData1.FieldByName('RxMemoryData1Field3').Value=1
     then RxMemoryData1.FieldByName('RxMemoryData1Field1').Value:=1;
    RxMemoryData1.post;
  end;


  s := FormatDateTime('yyyy-mm-dd', now);
  s := s + '=';
  if LastNum < 10 then s := s + '0' + IntToStr(LastNum) else s := s + IntToStr(LastNum);
  s := s + '==';
  //для кого
  RxMemoryData1.First;
  for i:=0 to ProjectCount -1 do
  begin
    if (RxMemoryData1.FieldByName('RxMemoryData1Field1').Value = 1) or (not rbData.Checked)
      then s := s + RxMemoryData1.FieldByName('RxMemoryData1Field4').Value
      else s := s + '_';
    RxMemoryData1.Next;
  end;
  s := s + '==';
  // где уже применён
  RxMemoryData1.First;
  for i:=0 to ProjectCount -1 do
  begin
    if RxMemoryData1.FieldByName('RxMemoryData1Field3').Value = 1
      then s := s + RxMemoryData1.FieldByName('RxMemoryData1Field4').Value
      else s := s + '_';
    RxMemoryData1.Next;
  end;
  s := s + '==';
  // где уже применён
  RxMemoryData1.First;
  for i:=0 to ProjectCount -1 do
  begin
    if RxMemoryData1.FieldByName('RxMemoryData1Field3').Value = 1
      then s := s + RxMemoryData1.FieldByName('RxMemoryData1Field4').Value+ '-1U-01==';
    RxMemoryData1.Next;
  end;


  s := s + Familiya + '==';

//  if
  if rbMetadata.Checked then s := s + 'metadata';
  if rbData.Checked then s := s + 'data';
  if rbIndex.Checked then s := s + 'index';
  if rbModules.Checked then s := s + 'modules';
  if CommentEdit.Text <> '' then s := s + '(' + StringReplace(CommentEdit.Text, ' ', '_', [rfReplaceAll]) + ')';

  With ScriptFileEdit do
  begin
    if Text<> '' then
    begin
      i := Length(Text);
      s := s + (Text[i-3]+Text[i-2]+Text[i-1]+Text[i])
    end;
  end;
 // s := s + '.sql';

  ScriptNameEdit.Text := s;
  RxMemoryData1.Locate('RxMemoryData1Field4', project, []);
end;



procedure TForm1.FormCreate(Sender: TObject);
var
 ini : TMemIniFile;
 i: integer;
begin
 ini := TMemIniFile.Create(ExtractFilePath(Application.ExeName) + 'app.ini');
 ScriptFileEdit.Text := ini.ReadString('Main', 'ScriptFile', ' ');
 ScriptsPathEdit.Text := ini.ReadString('Main', 'ScriptsPath', 'Z:\FMAS-WIN\DONNU\TEST\Scripts\');
 ScriptsNumPathEdit.Text := ini.ReadString('Main', 'ScriptsNumPath', 'Z:\FMAS-WIN\DONNU\TEST\Scripts\');
 if ScriptsNumPathEdit.Text <> ''
    then
      if ScriptsNumPathEdit.Text[Length(ScriptsNumPathEdit.Text)] <> '\'
        then ScriptsNumPathEdit.Text := ScriptsNumPathEdit.Text + '\';
 if ScriptsPathEdit.Text <> ''
  then
    if ScriptsPathEdit.Text[Length(ScriptsPathEdit.Text)] <> '\'
      then ScriptsPathEdit.Text := ScriptsPathEdit.Text + '\';
 if ParamCount >= 1
  then ScriptFileEdit.Text := ParamStr(1);

 if ParamStr(1)<>''
  then ScriptFileEdit.Text:= ParamStr(1);

 Familiya := ini.ReadString('Main', 'Familiya', '');
 ProjectCount := StrToInt(ini.ReadString('Projects','ProjectsCount','1'));
 SetLength(ProjectName,ProjectCount);
 SetLength(ProjectKey,ProjectCount);
 for i := 0 to ProjectCount - 1 do
  begin
    ProjectName[i] := ini.ReadString('Projects','Name'+IntToStr(i),'');
    ProjectKey[i] := ini.ReadString('Projects','KeyExpr'+IntToStr(i),'');
  end;

 for i := 0 to ProjectCount - 1 do
  begin
    RxMemoryData1.Active:=true;
    RxMemoryData1.Insert;
    RxMemoryData1.FieldByName('RxMemoryData1Field2').Value := ProjectName[ProjectCount - i - 1 ];
    RxMemoryData1.FieldByName('RxMemoryData1Field4').Value := ProjectKey[ProjectCount - i - 1 ];
    RxMemoryData1.FieldByName('RxMemoryData1Field1').Value := 1;
    RxMemoryData1.FieldByName('RxMemoryData1Field3').Value := 0;
    RxMemoryData1.Post;
   end;

 ini.Free;
 GetLastScriptNum;

    // реагировать на расширение

 With ScriptFileEdit do
 begin
  if Text <> ''
  then
    begin
    i := Length(Text);
    if (UpperCase(Text[i-3]+Text[i-2]+Text[i-1]+Text[i]) = '.RAR')
      or (UpperCase(Text[i-3]+Text[i-2]+Text[i-1]+Text[i]) = '.ZIP')
      then
        begin
          rbModules.Checked := true;
          rbData.Enabled := false;
          rbIndex.Enabled := false;
          rbMetadata.Enabled := false;
        end
      else
        begin
          rbModules.Checked := false;
          rbData.Enabled := true;
          rbIndex.Enabled := true;
          rbMetadata.Enabled := true;
          rbMetadata.Checked := true;
        end;
    end;
 end;

 if ParamStr(2)<>''
  then CommentEdit.Text:= ParamStr(2);


 MakeScriptName;
 FindTodayScripts;
// grdProjects.SetFocus;
  if LowerCase(ParamStr(3))=LowerCase('auto')
    then
      begin
        cxButton3Click(self);
        //xz
      end;
end;

procedure TForm1.rbMetadataClick(Sender: TObject);
begin
  MakeScriptName;
end;

procedure TForm1.rbDataClick(Sender: TObject);
begin
  MakeScriptName;
end;

procedure TForm1.cbBuhgClick(Sender: TObject);
begin
  MakeScriptName;
end;

procedure TForm1.GetLastScriptNum;
var
  sl : TStringList;
  sr : TSearchRec;
  s  : string;
  i1, i2 : Integer;
begin
  LastNum := 1;
  i1 := LastNum;
  i2 := i1;
  sl := TStringList.Create;
  if FindFirst(ScriptsNumPathEdit.Text + '*.sql', faAnyFile, sr) = 0 then
  begin
    repeat
      sl.Add(sr.Name);
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
  if FindFirst(ScriptsNumPathEdit.Text + '*.rar', faAnyFile, sr) = 0 then
  begin
    repeat
      sl.Add(sr.Name);
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
  if FindFirst(ScriptsNumPathEdit.Text + '*.zip', faAnyFile, sr) = 0 then
  begin
    repeat
      sl.Add(sr.Name);
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;


  if sl.Count <> 0 then
  begin
    sl.Sort;
    s := sl.Strings[sl.Count - 1];
    if Copy(s, 1, 10) = FormatDateTime('yyyy-mm-dd', now) then
    begin
      i1 := StrToInt(Copy(s, 12, 2)) + 1;
    end;
  end;
  sl.Free;


  sl := TStringList.Create;
  if FindFirst(ScriptsPathEdit.Text + '*.sql', faAnyFile, sr) = 0 then
  begin
    repeat
      sl.Add(sr.Name);
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
  if FindFirst(ScriptsPathEdit.Text + '*.rar', faAnyFile, sr) = 0 then
  begin
    repeat
      sl.Add(sr.Name);
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
  if FindFirst(ScriptsPathEdit.Text + '*.zip', faAnyFile, sr) = 0 then
  begin
    repeat
      sl.Add(sr.Name);
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;


  if sl.Count <> 0 then
  begin
    sl.Sort;
    s := sl.Strings[sl.Count - 1];
    if Copy(s, 1, 10) = FormatDateTime('yyyy-mm-dd', now) then
    begin
      i2 := StrToInt(Copy(s, 12, 2)) + 1;
    end;
  end;
  sl.Free;
  if i1 > i2 then LastNum := i1 else LastNum := i2;
end;

procedure TForm1.cxButton1Click(Sender: TObject);
begin
 Close;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
 ini : TIniFile;
begin
 ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'app.ini');
 ini.WriteString('Main', 'ScriptFile', ScriptFileEdit.Text);
 ini.WriteString('Main', 'ScriptsPath', ScriptsPathEdit.Text);
 ini.WriteString('Main', 'ScriptsNumPath', ScriptsNumPathEdit.Text);
 ini.WriteString('Main', 'Familiya', Familiya);
 ini.Free;
end;

procedure TForm1.cxButton2Click(Sender: TObject);
var
 i, checksum: integer;
begin
 checksum := 0;
 RxMemoryData1.First;
 for i := 0 to ProjectCount -1 do
  begin
    checksum := checksum + RxMemoryData1.FieldByName('RxMemoryData1Field1').Value;
    RxMemoryData1.Next;
  end;
 if checksum = 0 then
 begin
   ShowMessage('Необходимо указать для какого сервера применять скрипт!');
   Exit;
 end;

 if not FileExists(ScriptFileEdit.Text) then
 begin
   ShowMessage('Файл скрипта не существует.');
   Exit;
 end;
 RenameFile(ScriptFileEdit.Text, ExtractFilePath(ScriptFileEdit.Text) + ScriptNameEdit.Text);
 ShowMessage('Файл переименован.');
end;

procedure TForm1.cxButton3Click(Sender: TObject);
var
 ln : Integer;
 i, checksum: integer;
begin
 checksum := 0;
 RxMemoryData1.First;
 for i := 0 to ProjectCount -1 do
  begin
    checksum := checksum + RxMemoryData1.FieldByName('RxMemoryData1Field1').Value;
    RxMemoryData1.Next;
  end;
 if checksum = 0 then
 begin
   ShowMessage('Необходимо указать для какого сервера применять скрипт!');
   Exit;
 end;

 if not FileExists(ScriptFileEdit.Text) then
 begin
   ShowMessage('Файл скрипта не существует.');
   Exit;
 end;

 ln := LastNum;
 GetLastScriptNum;

 if ln <> LastNum then
 begin
   ShowMessage('Номер последнего скрипта изменился. Теперь он равен ' + IntToStr(LastNum));
 end;

 MakeScriptName;
 RenameFile(ScriptFileEdit.Text, ExtractFilePath(ScriptFileEdit.Text) + ScriptNameEdit.Text);
 try
  CopyFile(PAnsiChar(ExtractFilePath(ScriptFileEdit.Text) + ScriptNameEdit.Text), PAnsiChar(ScriptsPathEdit.Text + ScriptNameEdit.Text), True);
 except
  ShowMessage('Ошибка. Файл не скопирован.');
  Exit;
 end;
 ShowMessage('Файл скопирован.');

 //обновить скрипты за сегодня
 FindTodayScripts;
end;

procedure TForm1.ScriptFileEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var
    i: integer;
begin
 if not OpenDialog1.Execute then Exit;
 ScriptFileEdit.Text := OpenDialog1.FileName;
   // реагировать на расширение
 With ScriptFileEdit do
 begin
  i := Length(Text);
  if (UpperCase(Text[i-3]+Text[i-2]+Text[i-1]+Text[i]) = '.RAR')
     or (UpperCase(Text[i-3]+Text[i-2]+Text[i-1]+Text[i]) = '.ZIP')
    then
      begin
        rbModules.Checked := true;
        rbData.Enabled := false;
        rbIndex.Enabled := false;
        rbMetadata.Enabled := false;
        cheked.Editing:=false;
      end
    else
      begin
        rbModules.Checked := false;
        rbData.Enabled := true;
        rbIndex.Enabled := true;
        rbMetadata.Enabled := true;
        rbMetadata.Checked := true;
      end;
 end;
 MakeScriptName;
end;

procedure TForm1.ScriptsPathEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var s :string;
begin
  s:=BrowseDialog('Выберите каталог:', BIF_RETURNONLYFSDIRS);
  if s<>'' then
    if s[Length(s)]<>'\'
      then ScriptsPathEdit.Text := s +'\'
      else ScriptsPathEdit.Text := s;
end;

procedure TForm1.ScriptsNumPathEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var s :string;
begin
  s:=BrowseDialog('Выберите каталог:', BIF_RETURNONLYFSDIRS);
  if s<>'' then
    if s[Length(s)]<>'\'
      then ScriptsNumPathEdit.Text := s + '\'
      else ScriptsNumPathEdit.Text := s;
end;

procedure TForm1.FindTodayScripts;
var
  search_rec: TSearchRec;
  strings1: TStrings;
  i,k,j: integer;
  str:string;
begin
  lbScripts.Clear;
  cxLabel5.Caption := 'Скрипты за сегодня(' + ScriptsPathEdit.Text + ')';
  if FindFirst(ScriptsPathEdit.Text + FormatDateTime('yyyy-mm-dd', now) +'*.*', faAnyFile, search_rec) = 0 then
  begin
    repeat
    lbScripts.Items.Insert(0, search_rec.Name);
    until FindNext(search_rec) <> 0;
    FindClose(search_rec);
  end;
    lbScripts.Sorted:=false;
    lbScripts.Sorted:=true;
    j:=lbScripts.Items.Count-1;
    k:=round(j/2);
    if sort_invers
    then For i:=0 to k do
      lbScripts.Items.Exchange(i,j-i);

  lbScripts.ItemIndex := 0;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
  FindTodayScripts;
end;

procedure TForm1.Notepad1Click(Sender: TObject);
var
 s : string;
begin
  if lbScripts.ItemIndex =-1 then Exit;
  s := ScriptsPathEdit.Text + lbScripts.Items.Strings[lbScripts.ItemIndex];
  ShellExecute(0, 'open', PAnsiChar(s), PAnsiChar(''), nil, SW_SHOW); {'notepad.exe', PAnsiChar(s),}
end;

procedure TForm1.lbScriptsDblClick(Sender: TObject);
begin
 Notepad1Click(Self);
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  if lbScripts.ItemIndex =-1 then Exit;
  Clipboard.AsText := lbScripts.Items.Strings[lbScripts.ItemIndex];
end;

procedure TForm1.lbScriptsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key = ord('C')) and (ssCtrl in Shift) then N2Click(Self);
end;

procedure TForm1.cxRadioButton1Click(Sender: TObject);
begin
 MakeScriptName;
end;

procedure TForm1.CommentEditPropertiesChange(Sender: TObject);
begin
 MakeScriptName;
end;

procedure TForm1.cxButton4Click(Sender: TObject);
begin
 Clipboard.AsText := ScriptNameEdit.Text; 
end;

procedure TForm1.cxButton5Click(Sender: TObject);
var
  i: integer;
begin
  RxMemoryData1.First;
  for i:= 0 to RxMemoryData1.RecordCount -1 do
   begin
    RxMemoryData1.Edit;
    RxMemoryData1.FieldByName('RxMemoryData1Field1').Value := 1;
    RxMemoryData1.Post;
    RxMemoryData1.Next;
   end;
    MakeScriptName;
end;

procedure TForm1.cxButton6Click(Sender: TObject);
var
  i: integer;
begin
  RxMemoryData1.First;
  for i:= 0 to RxMemoryData1.RecordCount -1 do
   begin
    RxMemoryData1.Edit;
    RxMemoryData1.FieldByName('RxMemoryData1Field1').Value := 0;
    RxMemoryData1.FieldByName('RxMemoryData1Field3').Value := 0;
    RxMemoryData1.Post;
    RxMemoryData1.Next;
   end;
   MakeScriptName;
end;

procedure TForm1.cxButton7Click(Sender: TObject);
var
  i: integer;
begin
  RxMemoryData1.First;
  for i:= 0 to RxMemoryData1.RecordCount -1 do
   begin
    RxMemoryData1.Edit;
    if RxMemoryData1.FieldByName('RxMemoryData1Field3').Value=0
      then RxMemoryData1.FieldByName('RxMemoryData1Field1').Value := (RxMemoryData1.FieldByName('RxMemoryData1Field1').Value + 1) mod 2;
    RxMemoryData1.Post;
    RxMemoryData1.Next;
   end;
   MakeScriptName;
end;

procedure TForm1.rbIndexClick(Sender: TObject);
begin
  MakeScriptName;
end;

procedure TForm1.rbModulesClick(Sender: TObject);
begin
  MakeScriptName;
end;

procedure TForm1.grdProjectsDBTableView1EditChanged(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
var
  i: integer;
begin
  MakeScriptName;
end;

procedure TForm1.N4Click(Sender: TObject);
var
  i : integer;
begin
  sort_invers:=not sort_invers;
  FindTodayScripts;
end;

end.



//BCDGHLS
