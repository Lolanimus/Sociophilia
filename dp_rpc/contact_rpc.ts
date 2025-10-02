import { processRpcRequest } from "../api/helpers";

const getContacts = async () => {
  return await processRpcRequest("get_contacts");
};

const getContact = async (user_id: string) => {
  return await processRpcRequest("get_contact", {
    target_user_id: user_id,
  });
};

const addContact = async (target_username: string) => {
  return await processRpcRequest("add_contact", {
    target_username: target_username,
  });
};

const approveContact = async (user_id: string) => {
  return await processRpcRequest("approve_contact", {
    target_user_id: user_id,
  });
};

const deleteContact = async (user_id: string) => {
  return await processRpcRequest("delete_contact", {
    target_user_id: user_id,
  });
};

export { getContacts, getContact, addContact, approveContact, deleteContact };
