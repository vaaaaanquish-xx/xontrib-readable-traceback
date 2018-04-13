# -*- coding: utf-8 -*-
import xonsh.tools
import backtrace
import sys
from colorama import init, Fore, Style

$XONSH_SHOW_TRACEBACK=True


def __flush(message):
    """Using sys.stderr.buffer.write for xonsh.
    Reason please see TeeClass: https://github.com/xonsh/xonsh/blob/ff05ec33a22c1688674616a84ef66d65cef5b3c5/xonsh/base_shell.py#L217
    Origin: https://github.com/nir0s/backtrace/blob/f2c8683ec53e4fa48ea8c99c196b201bf22fda3e/backtrace.py#L36
    """
    st = message + '\n'
    sys.stderr.buffer.write(st.encode(encoding="utf-8"))
backtrace._flush=__flush


def _print_exception(msg=None):
    """Override xonsh.tools.print_exception.
    Origin: https://github.com/xonsh/xonsh/blob/230f77b2bc64cbc3e04837377252793f5d09b9ba/xonsh/tools.py#L798
    """
    tpe, v, tb = sys.exc_info()
    STYLES = {
        'backtrace': Fore.YELLOW + '{0}',
        'error': Fore.RED + Style.BRIGHT + '{0}',
        'line': Fore.RED + Style.BRIGHT + '{0}',
        'module': '{0}',
        'context': Style.BRIGHT + Fore.GREEN + '{0}',
        'call': Fore.RED + '--> ' + Fore.YELLOW + Style.BRIGHT + '{0}',
    }
    backtrace.hook(tb=tb, tpe=tpe, value=v, strip_path=True, styles=STYLES)
    if msg:
        msg = msg if msg.endswith('\n') else msg + '\n'
        sys.stderr.write(msg)
xonsh.tools.print_exception = _print_exception

