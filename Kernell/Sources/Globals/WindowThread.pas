unit WindowThread;
interface
uses Windows,Messages,Classes,SysUtils;

const
     NameIconWait='MESICON9';   //Название ресурса, который содержит иконку этого окна
     NameClass:string='Class Window of TThreadWindow';   //Название класса окна
     InterValTimeOut=20000; //Эта константа определяет, сколько времени надо ждать, пока
                            //будет обработано сообщение посланое потоку (0 - соответствует бесконечности)
resourcestring
     ErrorWait='Время ожидания истекло';
     ErrorABANDONED='Объект уже разрушен';
     ErrorStop='Поток не запущен';
     ErrorThread='При работе потока была ошибка'+#13#10+'%s';
     DefaultMessage='Увага! Йде обробка інформації';

Type
     TWndMethod = procedure(var Message: TMessage) of object;

     TThreadWindow=class (TThread)
     private
      fStarted:boolean;
      fShowTick: DWORD;
      fInterval:DWORD;
      fEventPosted:THandle;
      fVisible:boolean;
      fWND:HWND;
      fPercent: integer;
      fFont: HFont;
      fBrush:HBrush;
      fIcon:HIcon;
      fBoundRect:TRect;
      fTextError:String;
      fColor:integer;
      fTimer:UINT;
      fMessage_:PChar;
      fHObj:Pointer;
      procedure AllocateHWnd(Method: TWndMethod);
      procedure DeallocateHWnd;
      procedure SetMessage(const Value: String);
      procedure SetPercent(const Value: integer);
      procedure SetVisible(const Value: boolean);
      procedure ShowWND;
      procedure CloseWND;
      function GetBoundRect: TRect;
      procedure SetBoundRect(const Value: TRect);
      function GetInterval: DWORD;
      procedure SetInterval(const Value: DWORD);
      function GetWnd: HWND;
      function GetPercent: integer;
      function GetMessage: String;
      function GetVisible: boolean;
      function GetShowTick: DWORD;
      function GetStarted: boolean;
      procedure SetStarted(const Value: boolean);
      procedure ProcessMessage(MSG: TMSG);
      function GetColor: Integer;
      procedure SetColor(const Value: Integer);
     protected
      procedure Execute; override;
      procedure DoTerminate; override;
      procedure TimerProc(var M: TMessage);

      procedure WNDProc(var Message: TMessage); virtual;
      procedure WNDCreated(WND:HWND); virtual;
      procedure WNDDestroy(var WND:HWND); virtual;
      procedure DrawWND(DC:HDC); virtual;
      function GetProgressRect(BoundRect:TRect): TRect; virtual;
     public
      constructor Show(AMessage:string='');
      destructor Destroy; override;
      procedure AfterConstruction; override;

      function BeginMessage:boolean;                                //Эта процедура начинает обработку сообщения
      function WaitMessage:boolean;                                 //Эта процедура ожидает конца обработки сообщения
      property BoundRect:TRect read GetBoundRect write SetBoundRect;//Координаты окна
      property Wnd:HWND read GetWnd;                                //Дескриптор окна
      property ShowTick:DWORD read GetShowTick;                     //Время установки свойства Visible
      property Started:boolean read GetStarted write SetStarted;    //Признак того, что поток запущен
      property Percent:integer read GetPercent write SetPercent;    //Процент выполнения умноженный на 10
      property Interval:DWORD read GetInterval write SetInterval;   //Время в миллисекундах прошедшее с установки свойства Visible, до фактического отображения на экране
      property Message:String read GetMessage write SetMessage;     //Текст сообщения
      property Visible:boolean read GetVisible write SetVisible;    //Указывает, надо ли отображать окно
      property Color:Integer read GetColor write SetColor;          //Цвет окна
     end;


implementation


var UM_GetInfo,UM_SetInfo:UINT;

//Это относится к старым версиям Delphi 5 и ниже
{$IFDEF VER130}
const
  WS_EX_LAYERED = $00080000;
  LWA_ALPHA = $00000002;
  WS_EX_NOACTIVATE = $08000000;
resourcestring  
  SOSError = 'System Error.  Code: %d.'+#13#10+'%s';
  SUnkOSError = 'A call to an OS function failed';
type
  PBoolean=^Boolean;
  EOSError=class(EWin32Error)
  end;

procedure RaiseLastOSError;
var
  LastError: Integer;
  Error: EOSError;
begin
  LastError := GetLastError;
  if LastError <> 0 then
    Error := EOSError.CreateResFmt(@SOSError, [LastError,
      SysErrorMessage(LastError)])
  else
    Error := EOSError.CreateRes(@SUnkOSError);
  Error.ErrorCode := LastError;
  raise Error;
end;

// Replacement for MakeObjectInstance and FreeObjectInstance

// This is the maximum number of object instances that can be
// put in one memory page, with other reference data.
Const InstanceCount = 312;

type
  PObjectInstance = ^TObjectInstance;
  TObjectInstance = packed record
    Code: Byte;
    Offset: Integer;
    case Integer of
      0: (Next: PObjectInstance);
      1: (Method: TWndMethod);
  end;

  PInstanceBlock = ^TInstanceBlock;
  TInstanceBlock = packed record
    Next: PInstanceBlock;
    Code: array[1..2] of Byte;
    WndProcPtr: Pointer;
    Instances: array[0..InstanceCount] of TObjectInstance;
  end;

var
  InstBlockList: PInstanceBlock;
  InstFreeList: PObjectInstance;


{ Standard window procedure }
{ In    ECX = Address of method pointer }
{ Out   EAX = Result }

function StdWndProc(Window: HWND; Message, WParam: Longint;
  LParam: Longint): Longint; stdcall; assembler;
asm
        XOR     EAX,EAX
        PUSH    EAX
        PUSH    LParam
        PUSH    WParam
        PUSH    Message
        MOV     EDX,ESP
        MOV     EAX,[ECX].Longint[4]
        CALL    [ECX].Pointer
        ADD     ESP,12
        POP     EAX
end;

{ Allocate an object instance }

function CalcJmpOffset(Src, Dest: Pointer): Longint;
begin
  Result := Longint(Dest) - (Longint(Src) + 5);
end;

function MakeObjectInstance(Method: TWndMethod): Pointer;
const
  BlockCode: array[1..2] of Byte = (
    $59,       { POP ECX }
    $E9);      { JMP StdWndProc }
  PageSize = 4096;
var
  Block: PInstanceBlock;
  Instance: PObjectInstance;
begin
  if InstFreeList = nil then
  begin
    Block := VirtualAlloc(nil, PageSize, MEM_COMMIT, PAGE_EXECUTE_READWRITE);
    Block^.Next := InstBlockList;
    Move(BlockCode, Block^.Code, SizeOf(BlockCode));
    Block^.WndProcPtr := Pointer(CalcJmpOffset(@Block^.Code[2], @StdWndProc));
    Instance := @Block^.Instances;
    repeat
      Instance^.Code := $E8;  { CALL NEAR PTR Offset }
      Instance^.Offset := CalcJmpOffset(Instance, @Block^.Code);
      Instance^.Next := InstFreeList;
      InstFreeList := Instance;
      Inc(Longint(Instance), SizeOf(TObjectInstance));
    until Longint(Instance) - Longint(Block) >= SizeOf(TInstanceBlock);
    InstBlockList := Block;
  end;
  Result := InstFreeList;
  Instance := InstFreeList;
  InstFreeList := Instance^.Next;
  Instance^.Method := Method;
end;

{ Free an object instance }

procedure FreeObjectInstance(ObjectInstance: Pointer);
begin
  if ObjectInstance <> nil then
  begin
    PObjectInstance(ObjectInstance)^.Next := InstFreeList;
    InstFreeList := ObjectInstance;
  end;
end;
{$ENDIF}


TYPE EThreadWindow=class (Exception)
     public
     end;

{ TThreadWindow }
//Этот конструктор создает и отображает окно
constructor TThreadWindow.Show(AMessage:string='');
begin
 inherited Create(false);
 if AMessage<>'' then Message:=AMessage;
 Visible:=true;
end;

//Перед выполнением потока устанавливаем параметры по умолчанию
procedure TThreadWindow.AfterConstruction;
begin
 Color:=GetSysColor(COLOR_BTNFACE);
 Percent:=-1;
 Interval:=1000;
 Priority:=tpHighest;
 Message:=DefaultMessage;
 inherited;
end;

//Если при выполнении потока произошла какая-то ошибка, то по окончании
//генерируем соответствующую ошибку
procedure TThreadWindow.DoTerminate;
begin
  inherited;
  ReallocMem(fMessage_,0);
  if fTextError<>'' then raise EThreadWindow.CreateFMT(ErrorThread,[fTextError]);
end;

destructor TThreadWindow.Destroy;
begin
 try
  Started:=false;
 finally
  DeallocateHWnd;
  if fEventPosted<>0 then begin
   CloseHandle(fEventPosted);
   fEventPosted:=0;
  end;
 end;
 inherited;
end;

{REGION 'Установка различных свойств индикатора выполнения}
//===========================================================================
CONST
  IdRect=1;
  IdPercent=2;
  IdMessage=3;
  IdInterval=4;
  IdVisible=5;
  IdWND=6;
  IdShowTick=8;
  IdColor=9;

//Перед отправкой сообщения надо сбросить событие
function TThreadWindow.BeginMessage:boolean;
begin
 result:=fEventPosted<>0;
 if result and (not ResetEvent(fEventPosted)) then RaiseLastOSError;
end;

//Ждем ответа на сообщение
function TThreadWindow.WaitMessage:boolean;
var R:Cardinal;
begin
 if fEventPosted=0 then begin //Несчастный случай, когдa поток еще не начал работу
  sleep(10);
  if fEventPosted=0 then raise EThreadWindow.Create(ErrorABANDONED); //Поток закончен
 end;
 result:=true;
 R:=WaitForSingleObject(fEventPosted,InterValTimeOut);
 case R of
   WAIT_OBJECT_0:exit;
   WAIT_TIMEOUT:raise EThreadWindow.Create(ErrorWait);
   WAIT_ABANDONED:result:=false;
 else
   RaiseLastOSError;
 end
end;

//Проверяем, находится ли поток в запущеном состоянии
function TThreadWindow.GetStarted: boolean;
begin
 if fEventPosted=0 then Sleep(10);
 result:=(fEventPosted<>0) and (fStarted);
end;

//Завершаем, или запускаем поток
procedure TThreadWindow.SetStarted(const Value: boolean);
begin
 if not Value then begin
  if not fStarted then Sleep(10);
  if BeginMessage then begin
   PostThreadMessage(ThreadID,WM_QUIT,0,0);
   fStarted:=false;
   WaitFor;
  end;
 end else Resume;
end;

//Возвращаем координаты окна
function TThreadWindow.GetBoundRect: TRect;
var R:TRect;
begin
 if BeginMessage then begin
  FillChar(R,SizeOf(R),0);
  PostThreadMessage(ThreadID,UM_GetInfo,IdRect,integer(@R));
  WaitMessage;
  Result:=R;
 end else result:=fBoundRect;
end;

//Устанавливаем координаты окна
procedure TThreadWindow.SetBoundRect(const Value: TRect);
begin
 if BeginMessage then begin
  PostThreadMessage(ThreadID,UM_SetInfo,IdPercent,integer(@Value));
  WaitMessage;
 end else fBoundRect:=Value;
end;

//Возвращаем процент выполнения умноженный на 10 (0..1000)
function TThreadWindow.GetPercent: integer;
begin
 if BeginMessage then begin
  PostThreadMessage(ThreadID,UM_GetInfo,IdPercent,integer(@result));
  WaitMessage;
 end else result:=fPercent;
end;

//Устанавливаем процент выполнения. -1 делает индикатор невидимым
procedure TThreadWindow.SetPercent(const Value: integer);
begin
 if BeginMessage then begin
  PostThreadMessage(ThreadID,UM_SetInfo,IdPercent,integer(@Value));
  WaitMessage;
 end else fPercent:=value;
end;

//Возвращаем текст сообщения
function TThreadWindow.GetMessage: String;
var V:PChar;
begin
 result:='';
 if BeginMessage then begin
  PostThreadMessage(ThreadID,UM_GetInfo,IdMessage,integer(@V));
  WaitMessage;
  SetString(Result,V,Length(V));
 end else if fMessage_<>nil then SetString(result,fMessage_,Length(fMessage_));
end;

//Устанавливаем текст сообщения
procedure TThreadWindow.SetMessage(const Value: String);
var V:PChar;
begin
 if BeginMessage then begin
  V:=PChar(Value);
  PostThreadMessage(ThreadID,UM_SetInfo,IdMessage,integer(@V));
  WaitMessage;
 end else begin
  if Value<>'' then begin
   ReallocMem(fMessage_,Length(Value)+1);
   Move(Value[1],fMessage_^,Length(Value));
   fMessage_[Length(Value)]:=#0;
  end else ReallocMem(fMessage_,0);
 end;
end;

//Возвращаем интервал времени в милисекундах
function TThreadWindow.GetInterval: DWORD;
begin
 if BeginMessage then begin
  PostThreadMessage(ThreadID,UM_GetInfo,IdInterval,integer(@result));
  WaitMessage;
 end else result:=fInterval;
end;

//Устанавливаем интервал времени в милисекундах
//который должен пройти между установкой свойства
//Visible=true и появлением окна
procedure TThreadWindow.SetInterval(const Value: DWORD);
begin
 if BeginMessage then begin
  PostThreadMessage(ThreadID,UM_SetInfo,IdInterval,integer(@Value));
  WaitMessage;
 end else fInterval:=value;
end;

//Возвращаем значение True, если окно должно быть видимым
function TThreadWindow.GetVisible: boolean;
begin
 if BeginMessage then begin
  PostThreadMessage(ThreadID,UM_GetInfo,IdVisible,integer(@result));
  WaitMessage;
 end else result:=fVisible;
end;

//Устанавливаем значени
procedure TThreadWindow.SetVisible(const Value: boolean);
begin
 if BeginMessage then begin
  PostThreadMessage(ThreadID,UM_SetInfo,IdVisible,integer(@Value));
  WaitMessage;
 end else fVisible:=value;
end;

//Возвращаем дескриптор окна
//это аналог свойства Handle, которое есть в обычных формах
function TThreadWindow.GetWnd: HWND;
begin
 if BeginMessage then begin
  PostThreadMessage(ThreadID,UM_GetInfo,IdWND,integer(@result));
  WaitMessage;
 end else result:=fWND;
end;

//Возвращает число милисекунд прошедшее от момента запуска компьютера
//до установки свойства Visible=true
function TThreadWindow.GetShowTick: DWORD;
begin
 if BeginMessage then begin
  PostThreadMessage(ThreadID,UM_GetInfo,IdShowTick,integer(@result));
  WaitMessage;
 end else result:=fWND;
end;

//Возвращает цвет окна
function TThreadWindow.GetColor: Integer;
begin
 if BeginMessage then begin
  PostThreadMessage(ThreadID,UM_GetInfo,IdColor,integer(@result));
  WaitMessage;
 end else result:=fColor;
end;

//Устанавливает цвет окна
procedure TThreadWindow.SetColor(const Value: Integer);
begin
 if BeginMessage then begin
  PostThreadMessage(ThreadID,UM_SetInfo,IdColor,integer(@Value));
  WaitMessage;
 end else fColor:=Value;
end;

//===========================================================================
{ENDREGION}

//Эта функция возвращает прямоугольник, внутри которого изображается индикатор выполнения
function TThreadWindow.GetProgressRect(BoundRect:TRect):TRect;
var R:TRect;
begin
 R:=BoundRect;
 OffsetRect(R,-R.Left,-R.Top);
 InflateRect(R,-8,-8);
 inc(R.Left,48);
 R.Top:=R.Bottom-8;
 result:=R;
end;

//Эта процедура выполняемт отрисовку окна в заданном контексте DC
procedure TThreadWindow.DrawWND(DC: HDC);
var R,RR:TRect;
    X,Y:integer;
    OldBr:HBrush;
 procedure DrawProgress;
 var ProgressRect,TmpR:TRect;
     OldPen,Pen:HPen;
     Br:HBrush;
 begin
  ProgressRect:=GetProgressRect(fBoundRect);
  Pen:=CreatePen(PS_SOLID,1,GetSysColor(COLOR_3DSHADOW));
  OldPen:=SelectObject(DC,Pen);
  try
    if (fPercent>=0) and (fPercent<=1000) then begin
     Rectangle(DC,ProgressRect.Left,
                  ProgressRect.Top,
                  ProgressRect.Right,
                  ProgressRect.Bottom);
     TMPR:=ProgressRect;
     inflateRect(TMPR,-1,-1);
     TMPR.Right:=TMPR.Left+((TMPR.Right-TMPR.Left)*fPercent+500)div(1000);
     Br:=CreateSolidBrush(GetSysColor(COLOR_3DHILIGHT));
     try
        FillRect(DC,TMPR,Br);
     finally
        DeleteObject(Br);
     end;
     if TMPR.Right>TMPR.Left then TMPR.Left:=TMPR.Right;
     TMPR.Right:=ProgressRect.Right-1;
     if TMPR.Right>TMPR.Left then begin
        FillRect(DC,TMPR,OldBr);
     end;
     ExcludeClipRect(DC,ProgressRect.Left,ProgressRect.Top,ProgressRect.Right,ProgressRect.Bottom);
     R.Bottom:=ProgressRect.Top-2;
    end;
  finally
   Rectangle(DC,RR.Left,RR.Top,RR.Right,RR.Bottom);
   SelectObject(DC,OldPen);
   DeleteObject(Pen);
   TmpR:=RR;
   InflateRect(TmpR,-1,-1);
   Rectangle(DC,TmpR.Left,TmpR.Top,TmpR.Right,TmpR.Bottom);
  end;
 end;
begin
  R:=fBoundRect;
  OldBr:=SelectObject(DC,GetStockObject(NULL_BRUSH));
  try
    OffsetRect(R,-R.Left,-R.Top);
    RR:=R;
    X:=8;
    Y:=(R.Bottom-32) div (2);
    if Y>20 then Y:=20;
    InflateRect(R,-8,-8);
    inc(R.Left,48);
    DrawProgress;
    if fIcon<>0 then begin
     Windows.DrawIconEx(DC,X,Y,fIcon,0,0,0,OldBr,DI_DEFAULTSIZE or DI_NORMAL);
     ExcludeClipRect(DC,X,Y,X+32,Y+32);
    end;
    InflateRect(RR,-2,-2);
    FillRect(DC,RR,OldBr);
  finally
    SelectObject(DC,OldBr);
    if fMessage_<>nil then DrawText(DC,fMessage_,-1,R,DT_WORDBREAK or DT_LEFT);
  end;
end;

//Эта процедура обрабатывает сообщения полученные этим окном
procedure TThreadWindow.WNDProc(var Message: TMessage);
var OldBrush:HBrush;
    OldPen:HPen;
    OldFont:HFont;
    OldBk:Integer;
    NeedDC:boolean;
begin
 case Message.Msg of
  WM_ERASEBKGND: With TWMERASEBKGND(Message) do begin
   NeedDC:=DC=0;
   if NeedDC then DC:=GetWindowDC(fWND);
   try
    if fBrush<>0 then OldBrush:=SelectObject(DC,fBrush)
                 else OldBrush:=SelectObject(DC,GetStockObject(NULL_BRUSH));
    OldPen:=SelectObject(DC,GetStockObject(BLACK_PEN));
    OldFont:=SelectObject(DC,fFont);
    OldBk:=GetBkMode(DC);
    try
     SetBkMode(DC,TRANSPARENT);
     DrawWND(DC);
    finally
     SetBkMode(DC,OldBk);
     SelectObject(DC,OldFont);
     SelectObject(DC,OldPen);
     SelectObject(DC,OldBrush);
    end;
   finally
    if NeedDC then ReleaseDC(fWND,DC);
   end;
   exit;
  end;
 end;
 DefWindowProc(fWND,Message.Msg,Message.WParam,Message.LParam);
end;

//Создаем окно, корое принадлежит этому потоку
procedure TThreadWindow.AllocateHWnd(Method: TWndMethod);
var  TempClassInfo:TWndClass;
     WndClass: TWndClass;
     ClassRegistered: Boolean;
     HInst:THandle;
     HA:THandle;
     A:Array [0..255] of char;
     R:TRect;
 procedure SetFont;
  var NonClientMetrics: TNonClientMetrics;
    LogFont:tagLOGFONTA;
  begin
    NonClientMetrics.cbSize := sizeof(NonClientMetrics);
    if SystemParametersInfo(SPI_GETNONCLIENTMETRICS, 0, @NonClientMetrics, 0) then begin
      LogFont:=NonClientMetrics.lfStatusFont;
      fFont:=CreateFontIndirect(LogFont);
    end;
  end;
begin
  //Обнуление исходных данных
  if fWND<>0 then DeallocateHWnd;
  HInst:=hInstance{GetCurrentThread};
  if Hinst=0 then Exception.Create('Hinst '+SysErrorMessage(GetLastError));
  FillChar(TempClassInfo,SizeOf(TempClassInfo),0);
  FillChar(WndClass,SizeOf(WndClass),0);
  FillChar(A,SizeOf(A),0);
  move(NameClass[1],A,Length(NameClass));
  //Регистрация класса, если еще не зарегистрирован
  ClassRegistered := GetClassInfo(HInst, PChar(NameClass),  TempClassInfo);
  if not ClassRegistered then begin
     WndClass.style:=CS_GLOBALCLASS or CS_NOCLOSE or CS_SAVEBITS {or CS_DROPSHADOW};
     WndClass.lpfnWndProc:=@DefWindowProc;
     WndClass.hInstance:=HInst;
     WndClass.hbrBackground:=0;
     WndClass.lpszMenuName:='';
     WndClass.lpszClassName:=PChar(@A);
     HA:=Windows.RegisterClass(WndClass);
     if HA=0 then RaiseLastOSError;;
  end;
  //Создание окна
  if (fBoundRect.Right-fBoundRect.Left)=0 then begin //Получаем координаты окна по умолчанию
   R.Left:=(GetSystemMetrics(SM_CXFULLSCREEN)-300)div(2);
   R.Top:=(GetSystemMetrics(SM_CYFULLSCREEN)-58)div(4);
   R.Right:=R.Left+300;
   R.Bottom:=R.Top+58;
   fBoundRect:=R;
  end else R:=fBoundRect;
  fWND := CreateWindowEx(WS_EX_TOOLWINDOW OR WS_EX_TOPMOST or WS_EX_NOACTIVATE {or WS_EX_LAYOUTRTL},
                         PChar(@A),
                         'Wait',
                         WS_POPUP or WS_VISIBLE or WS_DISABLED,
                         R.Left, R.Top, Abs(R.Right-R.Left), Abs(R.Bottom-R.Top), 0, 0,
                         HInst,
                         nil);
  if fWND=0 then RaiseLastOSError;
  Windows.GetWindowRect(fWND,fBoundRect);
  if Assigned(Method) then begin
    fHObj:=MakeObjectInstance(Method);
    Windows.SetWindowLong(fWnd,GWL_WNDPROC,Integer(fHObj));
    InvalidateRect(fWnd,nil,true);
  end;
  SetFont;
  {fIcon:=LoadIcon(hInstance,NameIconWait);
  if fIcon=0 then fIcon:=LoadIcon(hInstance,'MAINICON');
  if fIcon=0 then fIcon:=LoadIcon(0,IDI_APPLICATION);}
  if (fColor<>$1FFFFFFF) and (fBrush=0) then fBrush:=CreateSolidBrush(fColor);
end;

//Удаление дескриптора окна и всех ресурсов окна
procedure TThreadWindow.DeallocateHWnd;
begin
 try
  if fBrush<>0 then begin
   if DeleteObject(fBrush) then fBrush:=0 else RaiseLastOSError;
  end;
  if (fIcon<>0) and (fIcon<>LoadIcon(0,IDI_APPLICATION)) then begin
   if DestroyIcon(fIcon) then fIcon:=0 else RaiseLastOSError;
  end;
  if fFont<>0 then begin
   if DeleteObject(fFont) then fFont:=0 else RaiseLastOSError;
  end;
 finally
  if fWnd<>0 then begin
   if DestroyWindow(fWnd) then fWND:=0
                          else RaiseLastOSError;
   if fHObj<>nil then begin
    FreeObjectInstance(fHObj);
    fHObj:=nil;
   end;
  end;
 end;
end;

//удаление окна
procedure TThreadWindow.CloseWND;
begin
 ResetEvent(fEventPosted);
 try
  try
   WNDDestroy(fWND);
  finally
   DeallocateHWnd;
  end;
 finally
  SetEvent(fEventPosted);
 end;
 fVisible:=false;
 fShowTick:=0;
end;

//Создание окна
procedure TThreadWindow.ShowWND;
begin
 try
  ResetEvent(fEventPosted);
  try
   AllocateHWnd(WNDProc);
   WNDCreated(fWND);
  finally
    SetEvent(fEventPosted);
  end;
 except
  on E:Exception do begin
   raise Exception(E.ClassType).Create('ShowWND:'+#13#10+E.Message);
  end;
 end;
end;

procedure TThreadWindow.WNDDestroy(var WND:HWND);
begin
 //Некоторые действия, которые надо выполнить перед разрушением окна
end;

procedure TThreadWindow.WNDCreated(WND:HWND);
begin
 //Некоторые действия которые необходимо выполнить после создания окна
end;

//По таймеру посылаем потоку пустое сообщение
//для того, чтобы поток вышел из режима ожидания
procedure TThreadWindow.TimerProc(var M: TMessage);
begin
 if ThreadID<>0 then PostThreadMessage(ThreadID,WM_NULL,0,0);
end;

//Если пришло сообщение процессу, или окно еще не создано, делаем что-то,
//иначе посылаем сообщение оконной функции
procedure TThreadWindow.ProcessMessage(MSG:TMSG);
var R:TRect;
    P:PChar;
    S:String;
    L:integer;
begin
 if (MSG.hwnd=0) or (fWND=0) then begin
  if MSG.message=UM_GetInfo then begin
    //Возвращение параметров
    case MSG.wParam of
               0: exit;
     IdRect     : begin
                    if fWND<>0 then Windows.GetWindowRect(fWND,fBoundRect);
                    Move(fBoundRect,Pointer(MSG.lParam)^,SizeOf(fBoundRect));
                  end;
     IdPercent  : begin
                    Move(fPercent,Pointer(MSG.lParam)^,SizeOf(fPercent));
                  end;
     IdMessage  : begin
                    Move(fMessage_,Pointer(MSG.lParam)^,SizeOf(fMessage_));
                  end;
     IdInterval : begin
                    Move(fInterval,Pointer(MSG.lParam)^,SizeOf(fInterval));
                  end;
     IdVisible  : begin
                    Move(fVisible,Pointer(MSG.lParam)^,SizeOf(fVisible));
                  end;
     IdWND      : begin
                    Move(fWND,Pointer(MSG.lParam)^,SizeOf(fWND));
                  end;
     IdShowTick : begin
                    Move(fShowTick,Pointer(MSG.lParam)^,SizeOf(fShowTick));
                  end;
     IdColor    : begin
                    Move(fColor,Pointer(MSG.lParam)^,SizeOf(fColor));
                  end;
    end;
  end else if MSG.message=UM_SetInfo then begin
    //Установка параметров
    case MSG.wParam of
               0: exit;
     IdRect     : begin
                   Move(Pointer(MSG.lParam)^,fBoundRect,SizeOf(fBoundRect));
                   if fWND<>0 then Windows.GetWindowRect(fWND,fBoundRect);
                    Windows.GetWindowRect(fWND,R);
                    Windows.SetWindowPos(fWND,
                                         HWND_TOP,
                                         fBoundRect.Left,
                                         fBoundRect.Top,
                                         Abs(fBoundRect.Right-fBoundRect.Left),
                                         Abs(fBoundRect.Bottom-fBoundRect.Top),
                                         {SWP_ASYNCWINDOWPOS or} SWP_NOACTIVATE or SWP_NOOWNERZORDER);
                    if (Abs(R.Right-R.Left)<>Abs(fBoundRect.Right-R.Left)) or
                       (Abs(R.Bottom-R.Top)<>Abs(fBoundRect.Bottom-R.Top)) then
                     Windows.InvalidateRect(fWND,nil,true);
                  end;
     IdPercent  : begin
                    Move(Pointer(MSG.lParam)^,fPercent,SizeOf(fPercent));
                    if fWND<>0 then begin
                     R:=GetProgressRect(fBoundRect);
                     Windows.InvalidateRect(fWND,@R,true);
                    end;
                  end;
     IdMessage  : begin
                    S:=fMessage_;
                    Move(Pointer(MSG.lParam)^,P,SizeOf(PChar));
                    if (String(P)<>String(fMessage_)) then begin //Здесь проверяем, a не равны ли строки
                     L:=Length(P);
                     if L>0 then begin
                      ReallocMem(fMessage_,L+1);
                      Move(P^,fMessage_^,L);
                      fMessage_[L]:=#0;
                     end else begin
                      ReallocMem(fMessage_,L);
                     end;
                     if (fWND<>0) and (fMessage_<>S) then Windows.InvalidateRect(fWND,nil,true);
                    end;
                  end;
     IdInterval : begin
                    Move(Pointer(MSG.lParam)^,fInterval,SizeOf(fInterval));
                  end;
     IdVisible  : begin
                    Move(Pointer(MSG.lParam)^,fVisible,SizeOf(fVisible));
                  end;
     IdColor    : begin
                    Move(Pointer(MSG.lParam)^,fColor,SizeOf(fColor));
                    if fWND<>0 then begin
                     if fBrush<>0 then begin
                      DeleteObject(fBrush);
                      fBrush:=0;
                     end;
                     if fColor<>$1FFFFFFF then fBrush:=CreateSolidBrush(fColor);
                     Windows.InvalidateRect(fWND,nil,true);
                    end;
                  end;
    end;
  end else begin
   //Обработка стандартных сообщений
  end;
 end else begin
  TranslateMessage(MSG);
  DispatchMessage(MSG);
 end
end;

//Основной поток
procedure TThreadWindow.Execute;
var MSG:TMSG;
  //Ждем, пока окно невидимо
  procedure WaitNoVisible;
  begin
   while (not fVisible) and (fStarted) do begin
    fStarted:=Windows.GetMessage(MSG,0,0,0);
    ResetEvent(fEventPosted);
    try
     if fStarted then ProcessMessage(MSG);
    finally
     SetEvent(fEventPosted);
    end;
   end;
  end;
  //Выжидаем, некоторое время, до того, как форма должна стать видимой
  procedure WaitInterval;
  var P:Pointer;
  begin
   P:=nil;
   fTimer:=0;
   try
    if fStarted and fVisible then begin
     ResetEvent(fEventPosted);
     fShowTick:=GetTickCount;
     P:=MakeObjectInstance(TimerProc);
     fTimer:=SetTimer(0,1,10,P);
     SetEvent(fEventPosted);
    end;
    while (fVisible) and (fStarted) and (GetTickCount-fShowTick<=fInterval) do begin
     fStarted:=Windows.GetMessage(MSG,0,0,0);
     ResetEvent(fEventPosted);
     try
      if fStarted then ProcessMessage(MSG);
     finally
      SetEvent(fEventPosted);
     end;
    end;
   finally
    if fTimer<>0 then if not KillTimer(0,fTimer) then RaiseLastOSError;
    if P<>nil then FreeObjectInstance(P);
   end;
  end;
  //В цикле обрабатываем сообщения посланые окну
  procedure MainCikl;
  begin
   while (fVisible) and (fStarted) do begin
    fStarted:=Windows.GetMessage(MSG,0,0,0);
    ResetEvent(fEventPosted);
    try
     if fStarted then ProcessMessage(MSG);
    finally
     SetEvent(fEventPosted);
    end;
   end;
  end;
BEGIN
 try
  try
   fEventPosted:=Windows.CreateEvent(nil,true,true,nil);
   if fEventPosted=0 then RaiseLastOSError;
   fStarted:=true;
   repeat
    WaitNoVisible;
    WaitInterval;
    if (fVisible) and (fStarted) then begin
       ShowWND;
       try
        MainCikl;
       finally
        CloseWND;
       end;
    end;
   until not fStarted;
  finally
   ResetEvent(fEventPosted);
   Windows.UnregisterClass(PChar(NameClass),hInstance);
   CloseHandle(fEventPosted);
   fEventPosted:=0;
  end;
 except
  on E:Exception do begin
   fTextError:=E.Message;
  end;
 end;
end;

initialization
 UM_GetInfo:=RegisterWindowMessage('TThreadWindow: UM_GetInfo');
 UM_SetInfo:=RegisterWindowMessage('TThreadWindow: UM_SetInfo');
finalization
end.


