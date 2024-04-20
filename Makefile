LIBRARY = libasm.a

NASM = nasm
NASM_FLAGS = -f elf64

SRC_FOLDER = src
ASM_FILES = ft_strlen.s ft_write.s ft_read.s ft_strcpy.s ft_strdup.s ft_strcmp.s
SRCS = $(addprefix $(SRC_FOLDER)/, $(ASM_FILES))

OBJ_FOLDER = obj
OBJS =$(addprefix $(OBJ_FOLDER)/, $(ASM_FILES:.s=.o))

INC = inc

CC = cc
CFLAGS = -Wall -Wextra -Werror -g -Iincludes
LFLAGS = -L. -lasm

all: $(LIBRARY)

$(LIBRARY): $(OBJS)
	@mkdir -p $(dir $@)
	@ar rcs $@ $(LIBRARY) $^

$(OBJ_FOLDER)/%.o: $(SRC_FOLDER)/%.s
	@mkdir -p $(dir $@)
	@$(NASM) $(NASM_FLAGS) $< -o $@

%.o: %.s
	@$(NASM) $(NASM_FLAGS) $< -o $@

clean:
	@rm -rf $(OBJS) $(OBJ_FOLDER)

fclean: clean
	@rm -rf $(LIBRARY)
	@rm -rf assembly

re: fclean
	@$(MAKE) all --no-print-directory

print_assembly:
	@printf "\033c";
	@for i in A_ AS_ ASS_ ASSE_ ASSEM_ ASSEMB_ ASSEMBL_ ASSEMBLY_; do \
		echo "$(GREEN) $$i"; \
		sleep 0.08; \
		printf "$(GREEN)\033c"; \
	done
	@printf '$(GREEN)ASSEMBLY$(RESET)\n'

assembly: print_assembly all main.c
	@$(CC) $(CFLAGS) main.c -o assembly $(LFLAGS)

.PHONY: all clean fclean re assembly

GREEN = \033[32m
RESET = \033[0m
